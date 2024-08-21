#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <cstring>
#include <unistd.h>
#include <sys/socket.h>
#include <linux/netlink.h>
#include <linux/rtnetlink.h>
#include <arpa/inet.h>
#include <net/if.h>
#include <errno.h>
#include <linux/if_arp.h>
#include <cstdio>
#include <memory>
#include <stdexcept>
#include <array>
#include <sstream>
#include <algorithm>

struct Interface {
    std::string name;
    std::string type;
    std::string status;
    std::string ip_address;
    std::string mac_address;
    std::vector<std::string> associated_macs;
};

void parse_arp_table(std::vector<Interface>& interfaces);

std::string get_interface_type(unsigned int ifi_type) {
    switch (ifi_type) {
        case ARPHRD_ETHER: return "Ethernet";
        case ARPHRD_LOOPBACK: return "Loopback";
        case ARPHRD_PPP: return "PPP";
        case ARPHRD_TUNNEL: return "Tunnel";
        default: return "Unknown";
    }
}

std::vector<Interface> get_network_interfaces() {
    std::vector<Interface> interfaces;

    int sock = socket(AF_NETLINK, SOCK_RAW, NETLINK_ROUTE);
    if (sock < 0) {
        std::cerr << "Failed to open netlink socket: " << strerror(errno) << std::endl;
        return interfaces;
    }

    struct sockaddr_nl addr;
    memset(&addr, 0, sizeof(addr));
    addr.nl_family = AF_NETLINK;
    addr.nl_pid = getpid();

    if (bind(sock, (struct sockaddr *)&addr, sizeof(addr)) < 0) {
        std::cerr << "Failed to bind netlink socket: " << strerror(errno) << std::endl;
        close(sock);
        return interfaces;
    }

    struct {
        struct nlmsghdr nlh;
        struct ifinfomsg ifi;
    } req;

    memset(&req, 0, sizeof(req));
    req.nlh.nlmsg_len = NLMSG_LENGTH(sizeof(struct ifinfomsg));
    req.nlh.nlmsg_type = RTM_GETLINK;
    req.nlh.nlmsg_flags = NLM_F_REQUEST | NLM_F_DUMP;
    req.ifi.ifi_family = AF_UNSPEC;

    if (send(sock, &req, req.nlh.nlmsg_len, 0) < 0) {
        std::cerr << "Failed to send netlink message: " << strerror(errno) << std::endl;
        close(sock);
        return interfaces;
    }

    char buf[8192];
    ssize_t len;

    while ((len = recv(sock, buf, sizeof(buf), 0)) > 0) {
        struct nlmsghdr *nlh = (struct nlmsghdr *)buf;
        for (; NLMSG_OK(nlh, len); nlh = NLMSG_NEXT(nlh, len)) {
            if (nlh->nlmsg_type == NLMSG_DONE) {
                goto done;
            }
            if (nlh->nlmsg_type == RTM_NEWLINK) {
                struct ifinfomsg *ifi = (struct ifinfomsg *)NLMSG_DATA(nlh);
                struct rtattr *rta = IFLA_RTA(ifi);
                int rtlen = IFLA_PAYLOAD(nlh);

                Interface iface;
                iface.status = (ifi->ifi_flags & IFF_UP) ? "UP" : "DOWN";
                iface.type = get_interface_type(ifi->ifi_type);

                for (; RTA_OK(rta, rtlen); rta = RTA_NEXT(rta, rtlen)) {
                    if (rta->rta_type == IFLA_IFNAME) {
                        iface.name = std::string((char *)RTA_DATA(rta));
                    } else if (rta->rta_type == IFLA_ADDRESS) {
                        unsigned char *mac = (unsigned char *)RTA_DATA(rta);
                        char mac_str[18];
                        snprintf(mac_str, sizeof(mac_str), "%02x:%02x:%02x:%02x:%02x:%02x",
                                 mac[0], mac[1], mac[2], mac[3], mac[4], mac[5]);
                        iface.mac_address = std::string(mac_str);
                    }
                }

                interfaces.push_back(iface);
            }
        }
    }

    if (len < 0) {
        std::cerr << "Error receiving netlink message: " << strerror(errno) << std::endl;
    }

done:
    close(sock);
    return interfaces;
}

void generate_dot_file(const std::vector<Interface>& interfaces) {
    std::ofstream dot_file("network_topology.dot");
    if (!dot_file.is_open()) {
        std::cerr << "Failed to open network_topology.dot for writing: " << strerror(errno) << std::endl;
        return;
    }

    dot_file << "digraph network_topology {\n";
    dot_file << "    rankdir=LR;\n";
    dot_file << "    node [shape=box];\n\n";

    for (const auto& iface : interfaces) {
        dot_file << "    " << iface.name << " [label=\"" << iface.name << "\\n"
                 << iface.type << "\\n" << iface.status << "\\n"
                 << "MAC: " << iface.mac_address << "\\n"
                 << "IP: " << iface.ip_address << "\"];\n";
    }

    dot_file << "\n    // Connections\n";
    for (size_t i = 0; i < interfaces.size(); ++i) {
        for (size_t j = i + 1; j < interfaces.size(); ++j) {
            dot_file << "    " << interfaces[i].name << " -> " << interfaces[j].name
                     << " [dir=both, label=\"Connection\"];\n";
        }
    }

    dot_file << "\n    // External network connection\n";
    dot_file << "    internet [shape=cloud, label=\"Internet\"];\n";
    if (!interfaces.empty()) {
        dot_file << "    " << interfaces[0].name << " -> internet [dir=both];\n";
    }

    dot_file << "}\n";
    dot_file.close();
}

int main() {
    std::vector<Interface> interfaces = get_network_interfaces();
    parse_arp_table(interfaces);
    generate_dot_file(interfaces);
    std::cout << "Network topology DOT file generated: network_topology.dot" << std::endl;
    return 0;
}

std::string exec(const char* cmd) {
    std::array<char, 128> buffer;
    std::string result;
    std::unique_ptr<FILE, decltype(&pclose)> pipe(popen(cmd, "r"), pclose);
    if (!pipe) {
        throw std::runtime_error("popen() failed!");
    }
    while (fgets(buffer.data(), buffer.size(), pipe.get()) != nullptr) {
        result += buffer.data();
    }
    return result;
}

void parse_arp_table(std::vector<Interface>& interfaces) {
    std::string arp_output = exec("arp -a");
    std::istringstream iss(arp_output);
    std::string line;

    while (std::getline(iss, line)) {
        std::istringstream line_iss(line);
        std::string hostname, ip, hw_type, mac, iface;

        // Parse the line, which is in the format: hostname (ip) at mac [ether] on iface
        if (std::getline(line_iss, hostname, '(') &&
            std::getline(line_iss, ip, ')') &&
            line_iss >> hw_type >> mac >> hw_type >> iface) {

            // Remove leading/trailing whitespace from ip
            ip.erase(0, ip.find_first_not_of(" \t"));
            ip.erase(ip.find_last_not_of(" \t") + 1);

            // Remove square brackets from mac address if present
            mac.erase(std::remove_if(mac.begin(), mac.end(), [](char c) { return c == '[' || c == ']'; }), mac.end());

            for (auto& interface : interfaces) {
                if (interface.name == iface) {
                    interface.associated_macs.push_back(mac);
                    if (interface.ip_address.empty()) {
                        interface.ip_address = ip;
                    }
                    break;
                }
            }
        }
    }
}
