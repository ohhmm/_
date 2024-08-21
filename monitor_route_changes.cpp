#include <iostream>
#include <cstring>
#include <unistd.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <linux/rtnetlink.h>
#include <net/if.h>
#include <linux/if_arp.h>

const int BUFFER_SIZE = 4096;

bool compare_mac(const unsigned char* mac1, const unsigned char* mac2) {
    return memcmp(mac1, mac2, 6) == 0;
}

void process_route_change(struct nlmsghdr* nlh, const unsigned char* target_mac) {
    struct rtmsg* rtm = (struct rtmsg*)NLMSG_DATA(nlh);
    struct rtattr* rta;
    int rtl = RTM_PAYLOAD(nlh);
    unsigned char mac[6];
    bool mac_found = false;

    for (rta = RTM_RTA(rtm); RTA_OK(rta, rtl); rta = RTA_NEXT(rta, rtl)) {
        if (rta->rta_type == RTA_DST) {
            if (rtm->rtm_family == AF_INET) {
                struct in_addr* addr = (struct in_addr*)RTA_DATA(rta);
                std::cout << "Destination IP: " << inet_ntoa(*addr) << std::endl;
            }
        } else if (rta->rta_type == RTA_GATEWAY) {
            if (rtm->rtm_family == AF_INET) {
                struct in_addr* addr = (struct in_addr*)RTA_DATA(rta);
                std::cout << "Gateway IP: " << inet_ntoa(*addr) << std::endl;
            }
        } else if (rta->rta_type == RTA_OIF) {
            int ifindex = *(int*)RTA_DATA(rta);
            char ifname[IF_NAMESIZE];
            if (if_indextoname(ifindex, ifname)) {
                std::cout << "Interface: " << ifname << std::endl;
            }
        } else if (rta->rta_type == NDA_LLADDR) {
            memcpy(mac, RTA_DATA(rta), 6);
            mac_found = true;
        }
    }

    if (mac_found && compare_mac(mac, target_mac)) {
        std::cout << "Route change detected for target MAC address" << std::endl;
        // Add any additional processing or notification here
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

    int sock = socket(AF_NETLINK, SOCK_RAW, NETLINK_ROUTE);
    if (sock < 0) {
        std::cerr << "Failed to open netlink socket" << std::endl;
        return 1;
    }

    struct sockaddr_nl addr;
    memset(&addr, 0, sizeof(addr));
    addr.nl_family = AF_NETLINK;
    addr.nl_groups = RTMGRP_LINK | RTMGRP_IPV4_ROUTE;

    if (bind(sock, (struct sockaddr*)&addr, sizeof(addr)) < 0) {
        std::cerr << "Failed to bind to netlink socket" << std::endl;
        close(sock);
        return 1;
    }

    char buffer[BUFFER_SIZE];
    struct iovec iov = { buffer, sizeof(buffer) };
    struct sockaddr_nl snl;
    struct msghdr msg = { &snl, sizeof(snl), &iov, 1, NULL, 0, 0 };

    std::cout << "Monitoring route changes for MAC: "
              << std::hex << (int)target_mac[0] << ":" << (int)target_mac[1] << ":"
              << (int)target_mac[2] << ":" << (int)target_mac[3] << ":"
              << (int)target_mac[4] << ":" << (int)target_mac[5] << std::dec << std::endl;

    while (true) {
        int status = recvmsg(sock, &msg, 0);
        if (status < 0) {
            std::cerr << "Failed to receive netlink message" << std::endl;
            continue;
        }

        struct nlmsghdr* nlh = (struct nlmsghdr*)buffer;
        for (; NLMSG_OK(nlh, (unsigned int)status); nlh = NLMSG_NEXT(nlh, status)) {
            if (nlh->nlmsg_type == RTM_NEWROUTE || nlh->nlmsg_type == RTM_DELROUTE) {
                process_route_change(nlh, target_mac);
            }
        }
    }

    close(sock);
    return 0;
}
