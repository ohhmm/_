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
#include <set>
#include <curl/curl.h>
#include <nlohmann/json.hpp>

using json = nlohmann::json;

struct Interface {
    std::string name;
    std::string type;
    std::string status;
    std::string ip_address;
    std::string mac_address;
    std::vector<std::string> associated_macs;
    bool is_bridge;
    std::vector<std::string> bridge_ports;
    std::vector<std::string> bridge_interfaces;
    std::string bridge_id;
    std::string stp_status;
    std::vector<std::string> connected_interfaces;
    bool is_docker_container;
    std::string container_id;
    std::string container_name;
    bool is_virtual_node;
    std::string virtual_node_type;
};

void parse_arp_table(std::vector<Interface>& interfaces);
void detect_bridge_interfaces(std::vector<Interface>& interfaces);
void discover_connected_nodes(std::vector<Interface>& interfaces);
void discover_connected_nodes_recursive(Interface& current, std::vector<Interface>& interfaces, std::set<std::string>& visited);

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
                iface.is_bridge = false;
                iface.bridge_id = "";
                iface.stp_status = "";

                for (; RTA_OK(rta, rtlen); rta = RTA_NEXT(rta, rtlen)) {
                    if (rta->rta_type == IFLA_IFNAME) {
                        iface.name = std::string((char *)RTA_DATA(rta));
                    } else if (rta->rta_type == IFLA_ADDRESS) {
                        unsigned char *mac = (unsigned char *)RTA_DATA(rta);
                        char mac_str[18];
                        snprintf(mac_str, sizeof(mac_str), "%02x:%02x:%02x:%02x:%02x:%02x",
                                 mac[0], mac[1], mac[2], mac[3], mac[4], mac[5]);
                        iface.mac_address = std::string(mac_str);
                    } else if (rta->rta_type == IFLA_LINKINFO) {
                        struct rtattr *link_info_attr = (struct rtattr *)RTA_DATA(rta);
                        int link_info_len = RTA_PAYLOAD(rta);

                        for (; RTA_OK(link_info_attr, link_info_len); link_info_attr = RTA_NEXT(link_info_attr, link_info_len)) {
                            if (link_info_attr->rta_type == IFLA_INFO_KIND) {
                                const char *kind = (const char *)RTA_DATA(link_info_attr);
                                if (strcmp(kind, "bridge") == 0) {
                                    iface.is_bridge = true;
                                    iface.type = "Bridge";
                                }
                            }
                        }
                    }
                }

                if (iface.is_bridge) {
                    // We'll populate bridge_interfaces, bridge_id, and stp_status in detect_bridge_interfaces()
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
                 << "IP: " << iface.ip_address;

        if (iface.type == "Bridge") {
            dot_file << "\\nBridge Interfaces:";
            for (const auto& slave : iface.bridge_interfaces) {
                dot_file << "\\n  " << slave;
            }
            dot_file << "\\nBridge ID: " << iface.bridge_id;
            dot_file << "\\nSTP Status: " << iface.stp_status;
        }

        if (!iface.associated_macs.empty()) {
            dot_file << "\\nAssociated MACs:";
            for (const auto& mac : iface.associated_macs) {
                dot_file << "\\n  " << mac;
            }
        }

        if (!iface.connected_interfaces.empty()) {
            dot_file << "\\nConnected Interfaces:";
            for (const auto& connected : iface.connected_interfaces) {
                dot_file << "\\n  " << connected;
            }
        }

        dot_file << "\"];\n";
    }

    dot_file << "\n    // Connections\n";
    for (const auto& iface : interfaces) {
        for (const auto& connected : iface.connected_interfaces) {
            dot_file << "    " << iface.name << " -> " << connected
                     << " [dir=both, label=\"Connection\"];\n";
        }
    }

    dot_file << "\n    // External network connection\n";
    dot_file << "    internet [shape=cloud, label=\"Internet\"];\n";
    auto gateway = std::find_if(interfaces.begin(), interfaces.end(),
        [](const Interface& iface) { return iface.type == "Ethernet" && !iface.ip_address.empty(); });
    if (gateway != interfaces.end()) {
        dot_file << "    " << gateway->name << " -> internet [dir=both];\n";
    }

    dot_file << "}\n";
    dot_file.close();
}

int main() {
    std::vector<Interface> interfaces = get_network_interfaces();
    parse_arp_table(interfaces);
    detect_bridge_interfaces(interfaces);
    discover_connected_nodes(interfaces);
    detect_docker_containers(interfaces);
    detect_virtual_nodes(interfaces);
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
        std::string dummy, address, hw_address, iface;

        // Parse the line in the format: ? (192.168.1.1) at 00:11:22:33:44:55 [ether] on eth0
        if (line_iss >> dummy >> address >> dummy >> hw_address >> dummy >> dummy >> iface) {
            // Remove parentheses from address
            address = address.substr(1, address.length() - 2);

            for (auto& interface : interfaces) {
                if (interface.name == iface) {
                    // Add the MAC address to associated_macs if it's not already there
                    if (std::find(interface.associated_macs.begin(), interface.associated_macs.end(), hw_address) == interface.associated_macs.end()) {
                        interface.associated_macs.push_back(hw_address);
                    }

                    // Set the IP address if it's empty
                    if (interface.ip_address.empty()) {
                        interface.ip_address = address;
                    }

                    break;
                }
            }
        }
    }
}

void detect_bridge_interfaces(std::vector<Interface>& interfaces) {
    std::string bridge_output = exec("brctl show");
    std::istringstream iss(bridge_output);
    std::string line;
    std::getline(iss, line); // Skip header line

    while (std::getline(iss, line)) {
        std::istringstream line_iss(line);
        std::string bridge_name, bridge_id, stp_status, port;

        if (line_iss >> bridge_name >> bridge_id >> stp_status) {
            for (auto& interface : interfaces) {
                if (interface.name == bridge_name) {
                    interface.type = "Bridge";
                    interface.is_bridge = true;
                    interface.bridge_id = bridge_id;
                    interface.stp_status = stp_status;

                    // Read bridge ports
                    while (line_iss >> port) {
                        interface.bridge_interfaces.push_back(port);
                    }

                    // Read additional lines for more ports
                    while (std::getline(iss, line) && !line.empty()) {
                        std::istringstream port_iss(line);
                        std::string additional_port;
                        if (port_iss >> additional_port) {
                            interface.bridge_interfaces.push_back(additional_port);
                        }
                    }

                    break;
                }
            }
        }
    }

    // Call the function to discover connected nodes
    discover_connected_nodes(interfaces);
}

void discover_connected_nodes(std::vector<Interface>& interfaces) {
    std::set<std::string> visited;
    for (auto& interface : interfaces) {
        if (interface.is_bridge) {
            for (const auto& port : interface.bridge_interfaces) {
                auto it = std::find_if(interfaces.begin(), interfaces.end(),
                    [&port](const Interface& iface) { return iface.name == port; });

                if (it != interfaces.end()) {
                    interface.connected_interfaces.push_back(it->name);
                    it->connected_interfaces.push_back(interface.name);
                    discover_connected_nodes_recursive(*it, interfaces, visited);
                }
            }
        }

        // For all interfaces, use MAC addresses to establish connections
        for (const auto& mac : interface.associated_macs) {
            for (auto& other : interfaces) {
                if (&other != &interface &&
                    (other.mac_address == mac ||
                     std::find(other.associated_macs.begin(), other.associated_macs.end(), mac) != other.associated_macs.end())) {
                    if (std::find(interface.connected_interfaces.begin(), interface.connected_interfaces.end(), other.name) == interface.connected_interfaces.end()) {
                        interface.connected_interfaces.push_back(other.name);
                    }
                    if (std::find(other.connected_interfaces.begin(), other.connected_interfaces.end(), interface.name) == other.connected_interfaces.end()) {
                        other.connected_interfaces.push_back(interface.name);
                    }
                }
            }
        }
    }
}

void discover_connected_nodes_recursive(Interface& current, std::vector<Interface>& interfaces, std::set<std::string>& visited) {
    if (visited.find(current.name) != visited.end()) {
        return; // Already visited this interface, avoid loops
    }
    visited.insert(current.name);

    for (const auto& mac : current.associated_macs) {
        // Find other interfaces with the same MAC address
        for (auto& other : interfaces) {
            if (&other != &current &&
                (other.mac_address == mac ||
                 std::find(other.associated_macs.begin(), other.associated_macs.end(), mac) != other.associated_macs.end())) {
                // Add connection between current and other interface if not already connected
                if (std::find(current.connected_interfaces.begin(), current.connected_interfaces.end(), other.name) == current.connected_interfaces.end()) {
                    current.connected_interfaces.push_back(other.name);
                    other.connected_interfaces.push_back(current.name);
                }

                // Recursively discover nodes connected to the other interface
                discover_connected_nodes_recursive(other, interfaces, visited);
            }
        }
    }
}

void detect_docker_containers(std::vector<Interface>& interfaces) {
    std::string docker_output = exec("docker network inspect mynetwork");
    json docker_json = json::parse(docker_output);

    for (const auto& container : docker_json[0]["Containers"].items()) {
        const auto& container_data = container.value();
        std::string container_id = container_data["Name"];
        std::string container_mac = container_data["MacAddress"];
        std::string container_ipv4 = container_data["IPv4Address"];

        // Remove CIDR notation from IPv4 address
        size_t pos = container_ipv4.find('/');
        if (pos != std::string::npos) {
            container_ipv4 = container_ipv4.substr(0, pos);
        }

        // Find the corresponding interface and update it
        auto it = std::find_if(interfaces.begin(), interfaces.end(),
            [&container_mac](const Interface& iface) { return iface.mac_address == container_mac; });

        if (it != interfaces.end()) {
            it->is_docker_container = true;
            it->container_id = container_id;
            it->container_name = container_data["Name"];
            it->ip_address = container_ipv4;
        }
    }
}

void detect_virtual_nodes(std::vector<Interface>& interfaces) {
    for (auto& iface : interfaces) {
        if (iface.name.substr(0, 4) == "veth") {
            iface.is_virtual_node = true;
            iface.virtual_node_type = "veth";
        } else if (iface.name.substr(0, 3) == "tun" || iface.name.substr(0, 3) == "tap") {
            iface.is_virtual_node = true;
            iface.virtual_node_type = iface.name.substr(0, 3);
        }
    }

    // Check for the specific virtual node MAC addresses
    const std::vector<std::string> target_macs = {"02:42:ac:11:00:03", "02:42:ac:11:00:04"};
    for (const auto& target_mac : target_macs) {
        auto it = std::find_if(interfaces.begin(), interfaces.end(),
            [&target_mac](const Interface& iface) { return iface.mac_address == target_mac; });

        if (it != interfaces.end()) {
            it->is_virtual_node = true;
            it->virtual_node_type = "custom_virtual_node";
        }
    }
}
