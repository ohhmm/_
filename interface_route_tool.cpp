#include <iostream>
#include <cstring>
#include <unistd.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <linux/rtnetlink.h>
#include <net/if.h>
#include <linux/if_arp.h>
#include <vector>
#include <string>
#include <sstream>
#include <algorithm>
#include <memory>
#include <stdexcept>
#include <array>

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

struct RouteInfo {
    std::string destination;
    std::string gateway;
    std::string interface;
};

std::vector<RouteInfo> get_routing_table() {
    std::vector<RouteInfo> routes;
    int sock = socket(AF_NETLINK, SOCK_RAW, NETLINK_ROUTE);
    if (sock < 0) {
        std::cerr << "Failed to open netlink socket" << std::endl;
        return routes;
    }

    struct sockaddr_nl addr;
    memset(&addr, 0, sizeof(addr));
    addr.nl_family = AF_NETLINK;
    addr.nl_pid = getpid();

    if (bind(sock, (struct sockaddr *)&addr, sizeof(addr)) < 0) {
        std::cerr << "Failed to bind to netlink socket" << std::endl;
        close(sock);
        return routes;
    }

    struct {
        struct nlmsghdr nlh;
        struct rtmsg rtm;
    } req;
    memset(&req, 0, sizeof(req));
    req.nlh.nlmsg_len = NLMSG_LENGTH(sizeof(struct rtmsg));
    req.nlh.nlmsg_type = RTM_GETROUTE;
    req.nlh.nlmsg_flags = NLM_F_REQUEST | NLM_F_DUMP;
    req.rtm.rtm_family = AF_INET;

    if (send(sock, &req, req.nlh.nlmsg_len, 0) < 0) {
        std::cerr << "Failed to send netlink message" << std::endl;
        close(sock);
        return routes;
    }

    char buf[8192];
    while (true) {
        int len = recv(sock, buf, sizeof(buf), 0);
        if (len < 0) {
            std::cerr << "Failed to receive netlink message" << std::endl;
            break;
        }
        if (len == 0) break;

        struct nlmsghdr *nlh = (struct nlmsghdr *)buf;
        for (; NLMSG_OK(nlh, len); nlh = NLMSG_NEXT(nlh, len)) {
            if (nlh->nlmsg_type == NLMSG_DONE) goto done;

            if (nlh->nlmsg_type == RTM_NEWROUTE) {
                RouteInfo route;
                struct rtmsg *rtm = (struct rtmsg *)NLMSG_DATA(nlh);
                struct rtattr *rta = RTM_RTA(rtm);
                int rtlen = RTM_PAYLOAD(nlh);

                for (; RTA_OK(rta, rtlen); rta = RTA_NEXT(rta, rtlen)) {
                    switch (rta->rta_type) {
                        case RTA_DST: {
                            char addr[INET_ADDRSTRLEN];
                            inet_ntop(AF_INET, RTA_DATA(rta), addr, sizeof(addr));
                            route.destination = addr;
                            break;
                        }
                        case RTA_GATEWAY: {
                            char addr[INET_ADDRSTRLEN];
                            inet_ntop(AF_INET, RTA_DATA(rta), addr, sizeof(addr));
                            route.gateway = addr;
                            break;
                        }
                        case RTA_OIF: {
                            int ifindex = *(int *)RTA_DATA(rta);
                            char ifname[IF_NAMESIZE];
                            if (if_indextoname(ifindex, ifname)) {
                                route.interface = ifname;
                            }
                            break;
                        }
                    }
                }
                routes.push_back(route);
            }
        }
    }

done:
    close(sock);
    return routes;
}

std::string find_interface_for_mac(const std::string& mac_address) {
    std::string arp_output = exec("arp -a");
    std::istringstream iss(arp_output);
    std::string line;

    std::cout << "Debug: ARP output:\n" << arp_output << std::endl;

    while (std::getline(iss, line)) {
        std::cout << "Debug: Processing line: " << line << std::endl;
        std::istringstream line_iss(line);
        std::string dummy, ip, hw_address, iface;

        // Try to parse the line
        if (line_iss >> dummy >> ip) {
            // Remove parentheses from IP address if present
            if (ip.front() == '(' && ip.back() == ')') {
                ip = ip.substr(1, ip.length() - 2);
            }

            // Skip "at" if present
            if (line_iss >> dummy && dummy != "at") {
                line_iss.unget();
            }

            if (line_iss >> hw_address) {
                // Remove square brackets if present
                if (hw_address.front() == '[' && hw_address.back() == ']') {
                    hw_address = hw_address.substr(1, hw_address.length() - 2);
                }

                // Skip "[ether]" or similar if present
                if (line_iss >> dummy && dummy.front() != 'o') {
                    line_iss.unget();
                }

                if (line_iss >> dummy >> iface) {
                    std::cout << "Debug: Parsed - IP: " << ip << ", MAC: " << hw_address << ", Interface: " << iface << std::endl;

                    // Convert hw_address to lowercase for case-insensitive comparison
                    std::transform(hw_address.begin(), hw_address.end(), hw_address.begin(), ::tolower);
                    std::string mac_lower = mac_address;
                    std::transform(mac_lower.begin(), mac_lower.end(), mac_lower.begin(), ::tolower);

                    if (hw_address == mac_lower) {
                        std::cout << "Debug: MAC address match found" << std::endl;
                        return iface;
                    }
                }
            }
        }
    }

    std::cout << "Debug: MAC address not found" << std::endl;
    return ""; // MAC address not found
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        std::cerr << "Usage: " << argv[0] << " <MAC_ADDRESS>" << std::endl;
        return 1;
    }

    std::string mac_address = argv[1];
    std::string interface = find_interface_for_mac(mac_address);

    if (!interface.empty()) {
        std::cout << "Route to MAC address " << mac_address << " goes through interface: " << interface << std::endl;
    } else {
        std::cout << "No route found for MAC address " << mac_address << std::endl;
    }

    return 0;
}
