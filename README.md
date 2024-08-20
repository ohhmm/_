# Network Topology Diagram Generator

This repository contains the necessary files and documentation to generate a network topology diagram using shell commands and Graphviz.

## Prerequisites

Before you begin, ensure you have Graphviz installed on your system. If not, you can install it using the following command:

```bash
sudo apt-get update
sudo apt-get install graphviz
```

## Generating the Network Topology Diagram

Follow these steps to generate the network topology diagram:

1. Gather network information:
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

This process uses Graphviz to create a visual representation of the network topology. The `ip` commands gather information about network interfaces. The DOT file (network_topology.dot) describes the graph structure, which Graphviz then renders into a PDF.

The resulting diagram shows the relationships between different network interfaces (lo, ens5, docker0) and their connections, including an external internet connection.

## Files

- `network_topology.dot`: Contains the DOT language description of the network topology.
- `network_topology.pdf`: The generated PDF file containing the visual network topology diagram.

Feel free to modify the `network_topology.dot` file to reflect changes in your network configuration or to add more details to the diagram.
