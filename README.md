# SPDK initial task

Everything you need you will find in spdk documentation (spdk.io). 

download latest version of spdk, compile and run the spdk nvmf/tcp application.
using the rpc interface, create the following configuration (no code customization required, you can create those purely from command line):
- create a malloc bdev
- create a pass-through bdev on top  of it
- create a namespace and subsystem on top and connect to it from the same host (local tcp)

The data processing path looks as follows:
host nvme device connected (e.g. dev/nvme1n1) --> nvme-tcp (linux kernel) --> tcp (local loopback) --> SPDK PROCESS --> nvmf/tcp target --> nvmf/tcp subsystem --> nvmf namespace --> pass-through --> malloc
- test it by reading and writing some data to the block device using python or bash and linux dd or by creating a fs and mounting it

Simple Customization:

change the pass-through bdev  as follows:
1. we want an RPC to configure the pass-through bdev in three modes: read-only, full, blocked.
2. based on the RPC, the pass-through bdev will either allow the io to go through (default behaviour) or let only read IO pass or let no IO pass
(block all IO)
3. Implement a new RPC that retrieves statistics for the pass-through bdev. The statistics should include:
Total read I/O requests (count).
Total write I/O requests (count).
Total blocked I/O requests (count, if the bdev is in "blocked" mode).
Total bytes read and written.

Test the resulting customization in all three modes by issuing the RPC and then running io (read, write).


## Prerequisites

Before you begin, ensure you have prerequisites installed on your system. If not, you can install it using the following command:

```bash
sudo apt update
sudo apt build-dep python3
sudo apt install -y python3-pyelftools dpdk libdpdk-dev libfuse3-dev libisal-dev help2man meson libcunit1-dev libaio-dev libhugetlbfs-bin nvme-cli
sudo apt install -y nasm yasm libssl-dev libnuma-dev librdmacm-dev libibverbs-dev


```

## Generating the Network Topology Diagram

Follow these steps to generate the network topology diagram:

1. Gather network information using rtnetlink via the `ip` command:
   ```bash
   ip -br link show
   ip -br addr show
   ```

2. Create a DOT file (network_topology.dot) with the network topology information:
   ```bash
   cat << EOF > network_topology.dot
   digraph network_topology {
       rankdir=LR;
       node [shape=box];

       // Loopback interface
       lo [label="lo\nLoopback\nUP"];

       // Ethernet interface
       ens5 [label="ens5\nEthernet\nUP"];

       // Docker bridge interface
       docker0 [label="docker0\nDocker Bridge\nDOWN"];

       // Connections
       ens5 -> lo [dir=both, label="Internal"];
       ens5 -> docker0 [dir=both, label="Docker Network"];

       // External network connection
       internet [shape=cloud, label="Internet"];
       ens5 -> internet [dir=both];
   }
   EOF
   ```

3. Generate the PDF file from the DOT file:
   ```bash
   dot -Tpdf network_topology.dot -o network_topology.pdf
   ```

4. View the generated PDF:
   ```bash
   xdg-open network_topology.pdf
   ```

## Explanation

This process uses Graphviz to create a visual representation of the network topology. The `ip` commands utilize rtnetlink, a Linux kernel interface, to gather information about network interfaces. Rtnetlink provides a way for user-space programs to communicate with the kernel's networking subsystem, allowing us to retrieve detailed network configuration data.

The `ip` command acts as a user-space tool that leverages rtnetlink to query the kernel for network interface information. When we run `ip -br link show` and `ip -br addr show`, these commands use rtnetlink to request and receive data about network interfaces, their status, and IP addresses from the kernel.

The gathered information is then used to create a DOT file (network_topology.dot), which describes the graph structure. Graphviz uses this DOT file to render the final PDF, visualizing the network topology.

The resulting diagram shows the relationships between different network interfaces (lo, ens5, docker0) and their connections, including an external internet connection. This visual representation helps in understanding the network configuration obtained through rtnetlink.

## Files

- `network_topology.dot`: Contains the DOT language description of the network topology.
- `network_topology.pdf`: The generated PDF file containing the visual network topology diagram.

Feel free to modify the `network_topology.dot` file to reflect changes in your network configuration or to add more details to the diagram. Remember that any changes should be based on the actual network information obtained through rtnetlink via the `ip` command.
