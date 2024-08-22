#include <iostream>
#include <cstring>
#include <unistd.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <linux/rtnetlink.h>
#include <net/if.h>
#include <linux/if_arp.h>
#include <fstream>
#include <sstream>
#include <iomanip>
#include <chrono>
#include <ctime>
#include <cstdarg>
#include <memory>

const char* LOG_FILE = "/var/log/monitor_route_changes.log";
const int BUFFER_SIZE = 4096;

template<typename... Args>
std::string format_string(const std::string& format, Args... args) {
    int size = snprintf(nullptr, 0, format.c_str(), args...) + 1;
    std::unique_ptr<char[]> buf(new char[size]);
    snprintf(buf.get(), size, format.c_str(), args...);
    return std::string(buf.get(), buf.get() + size - 1);
}

// Logging functions
void log_message(const char* level, const char* message) {
    std::ofstream log_file(LOG_FILE, std::ios::app);
    if (log_file.is_open()) {
        auto now = std::chrono::system_clock::now();
        auto now_c = std::chrono::system_clock::to_time_t(now);
        struct tm* parts = std::localtime(&now_c);

        char time_buffer[100];
        std::strftime(time_buffer, sizeof(time_buffer), "%Y-%m-%d %H:%M:%S", parts);

        log_file << format_string("%s [%s] %s", time_buffer, level, message) << std::endl;
        log_file.close();
    }
}

void log_info(const std::string& message) {
    log_message("INFO", message.c_str());
}

void log_debug(const std::string& message) {
    log_message("DEBUG", message.c_str());
}

void log_error(const std::string& message) {
    log_message("ERROR", message.c_str());
}

bool compare_mac(const unsigned char* mac1, const unsigned char* mac2) {
    return memcmp(mac1, mac2, 6) == 0;
}

void process_route_change(struct nlmsghdr* nlh, const unsigned char* target_mac) {
    struct rtmsg* rtm = (struct rtmsg*)NLMSG_DATA(nlh);
    struct rtattr* rta;
    int rtl = RTM_PAYLOAD(nlh);
    unsigned char mac[6];
    bool mac_found = false;

    std::stringstream ss;
    ss << "Received netlink message: type=";
    switch (nlh->nlmsg_type) {
        case RTM_NEWROUTE: ss << "RTM_NEWROUTE"; break;
        case RTM_DELROUTE: ss << "RTM_DELROUTE"; break;
        default: ss << nlh->nlmsg_type;
    }
    ss << ", len=" << nlh->nlmsg_len;
    log_info(ss.str().c_str());

    ss.str("");
    ss << "Route message details: family=" << (int)rtm->rtm_family
       << ", table=" << (int)rtm->rtm_table
       << ", protocol=" << (int)rtm->rtm_protocol
       << ", scope=" << (int)rtm->rtm_scope
       << ", type=" << (int)rtm->rtm_type;
    log_debug(ss.str().c_str());

    for (rta = RTM_RTA(rtm); RTA_OK(rta, rtl); rta = RTA_NEXT(rta, rtl)) {
        ss.str("");
        ss << "Attribute: type=" << rta->rta_type << ", len=" << rta->rta_len;
        log_debug(ss.str().c_str());

        switch (rta->rta_type) {
            case RTA_DST:
                if (rtm->rtm_family == AF_INET) {
                    struct in_addr* addr = (struct in_addr*)RTA_DATA(rta);
                    ss.str("");
                    ss << "Destination IP: " << inet_ntoa(*addr);
                    log_info(ss.str().c_str());
                }
                break;
            case RTA_GATEWAY:
                if (rtm->rtm_family == AF_INET) {
                    struct in_addr* addr = (struct in_addr*)RTA_DATA(rta);
                    ss.str("");
                    ss << "Gateway IP: " << inet_ntoa(*addr);
                    log_info(ss.str().c_str());
                }
                break;
            case RTA_OIF:
                {
                    int ifindex = *(int*)RTA_DATA(rta);
                    char ifname[IF_NAMESIZE];
                    if (if_indextoname(ifindex, ifname)) {
                        ss.str("");
                        ss << "Interface: " << ifname;
                        log_info(ss.str().c_str());
                    } else {
                        ss.str("");
                        ss << "Failed to get interface name for index " << ifindex << ": " << strerror(errno);
                        log_error(ss.str().c_str());
                    }
                }
                break;
            case NDA_LLADDR:
                if (RTA_PAYLOAD(rta) != 6) {
                    ss.str("");
                    ss << "Invalid MAC address length: " << RTA_PAYLOAD(rta);
                    log_error(ss.str().c_str());
                    break;
                }
                memcpy(mac, RTA_DATA(rta), 6);
                mac_found = true;
                ss.str("");
                ss << "MAC address found: "
                   << std::hex << std::setfill('0') << std::setw(2) << (int)mac[0] << ":"
                   << std::hex << std::setfill('0') << std::setw(2) << (int)mac[1] << ":"
                   << std::hex << std::setfill('0') << std::setw(2) << (int)mac[2] << ":"
                   << std::hex << std::setfill('0') << std::setw(2) << (int)mac[3] << ":"
                   << std::hex << std::setfill('0') << std::setw(2) << (int)mac[4] << ":"
                   << std::hex << std::setfill('0') << std::setw(2) << (int)mac[5];
                log_info(ss.str().c_str());
                break;
            default:
                ss.str("");
                ss << "Unhandled attribute type: " << rta->rta_type;
                log_debug(ss.str().c_str());
        }
    }

    if (mac_found) {
        if (compare_mac(mac, target_mac)) {
            log_info("Route change detected for target MAC address");
            // Add any additional processing or notification here
        } else {
            log_debug("MAC address found but does not match target");
        }
    } else {
        log_debug("No MAC address found in this route change message");
    }
}

int main(int argc, char* argv[]) {
    if (argc != 2) {
        std::cerr << "Usage: " << argv[0] << " <MAC_ADDRESS>" << std::endl;
        return 1;
    }

    unsigned char target_mac[6];
    if (sscanf(argv[1], "%hhx:%hhx:%hhx:%hhx:%hhx:%hhx",
               &target_mac[0], &target_mac[1], &target_mac[2],
               &target_mac[3], &target_mac[4], &target_mac[5]) != 6) {
        std::cerr << "Invalid MAC address format" << std::endl;
        return 1;
    }

    // Log the start of the program
    log_info("Starting monitor_route_changes");

    log_info(format_string("Starting monitor_route_changes for MAC: %02x:%02x:%02x:%02x:%02x:%02x",
             target_mac[0], target_mac[1], target_mac[2],
             target_mac[3], target_mac[4], target_mac[5]));

    int sock = socket(AF_NETLINK, SOCK_RAW, NETLINK_ROUTE);
    if (sock < 0) {
        log_error(format_string("Failed to open netlink socket: %s", strerror(errno)));
        return 1;
    }

    struct sockaddr_nl addr;
    memset(&addr, 0, sizeof(addr));
    addr.nl_family = AF_NETLINK;
    addr.nl_groups = RTMGRP_LINK | RTMGRP_IPV4_ROUTE;

    if (bind(sock, (struct sockaddr*)&addr, sizeof(addr)) < 0) {
        log_error(format_string("Failed to bind to netlink socket: %s", strerror(errno)));
        close(sock);
        return 1;
    }

    // Verify socket setup
    socklen_t addr_len = sizeof(addr);
    if (getsockname(sock, (struct sockaddr*)&addr, &addr_len) < 0) {
        log_error(format_string("Failed to get socket name: %s", strerror(errno)));
        close(sock);
        return 1;
    }
    log_info(format_string("Netlink socket bound successfully. Address family: %d, Multicast groups: %u",
                           addr.nl_family, addr.nl_groups));

    char buffer[BUFFER_SIZE];
    struct iovec iov = { buffer, sizeof(buffer) };
    struct sockaddr_nl snl;
    struct msghdr msg = { &snl, sizeof(snl), &iov, 1, NULL, 0, 0 };

    log_info(format_string("Monitoring route changes for MAC: %02x:%02x:%02x:%02x:%02x:%02x",
             target_mac[0], target_mac[1], target_mac[2],
             target_mac[3], target_mac[4], target_mac[5]));

    while (true) {
        int status = recvmsg(sock, &msg, 0);
        if (status < 0) {
            log_error(format_string("Failed to receive netlink message: %s", strerror(errno)));
            continue;
        }

        struct nlmsghdr* nlh = (struct nlmsghdr*)buffer;
        for (; NLMSG_OK(nlh, (unsigned int)status); nlh = NLMSG_NEXT(nlh, status)) {
            std::stringstream ss;
            ss << "Received netlink message: type=" << nlh->nlmsg_type
               << ", len=" << nlh->nlmsg_len;
            log_info(ss.str());

            switch (nlh->nlmsg_type) {
                case RTM_NEWROUTE:
                    log_info("Processing new route message");
                    process_route_change(nlh, target_mac);
                    break;
                case RTM_DELROUTE:
                    log_info("Processing delete route message");
                    process_route_change(nlh, target_mac);
                    break;
                case RTM_NEWLINK:
                    log_info("Received new link message (ignored)");
                    break;
                case RTM_DELLINK:
                    log_info("Received delete link message (ignored)");
                    break;
                case NLMSG_ERROR:
                    {
                        log_error("Received error message");
                        struct nlmsgerr* err = (struct nlmsgerr*)NLMSG_DATA(nlh);
                        log_error(format_string("Error: %s", strerror(-err->error)));
                    }
                    break;
                default:
                    log_info(format_string("Received unknown message type: %d", nlh->nlmsg_type));
            }
        }
    }

    close(sock);
    return 0;
}
