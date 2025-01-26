#!/bin/bash
set -x
SPDK_PATH=$(realpath ~/spdk)
SCRIPT_DIR=$(dirname "$(realpath "$0")")
echo $SCRIPT_DIR
sleep 5

ls /dev/nvme* > $SCRIPT_DIR/nvme.lst.bak

# Exit immediately if a command exits with a non-zero status
set -e

SPDK_RPC=$SPDK_PATH/scripts/rpc.py

echo "Creating malloc bdev using $SPDK_RPC"
sudo $SPDK_RPC bdev_malloc_create -b Malloc0 8192 512 || echo "Error Creating malloc bdev"
sleep 5

echo "Creating pass-through bdev on top of malloc bdev using $SPDK_RPC"
sudo $SPDK_RPC bdev_passthru_create -b Malloc0 -p PTBdev0 || echo "Error Creating pass-through bdev"
sleep 5

echo "Creating NVMf transport"
sudo $SPDK_RPC nvmf_create_transport -t TCP -u 8192 || echo "Error Creating NVMf transport"
sleep 5

echo "Creating NVMf subsystem"
sudo $SPDK_RPC nvmf_create_subsystem nqn.2025-01.io.spdk:cnode1 -a -s SPDK00000000000001 -d SPDK_Controller1 || echo "Error Creating NVMf subsystem"
sleep 5

echo "Creating NVMf namespace using $SPDK_RPC"
sudo $SPDK_RPC nvmf_subsystem_add_ns nqn.2025-01.io.spdk:cnode1 PTBdev0 || echo "Error Adding NVMf namespace"
sleep 5

echo "Creating NVMf subsystem and namespace using $SPDK_RPC"
sudo $SPDK_RPC nvmf_subsystem_add_listener nqn.2025-01.io.spdk:cnode1 -t tcp -a 127.0.0.1 -s 4420 || echo "Error Adding NVMf listener"
sleep 5

echo "Connecting to NVMf subsystem locally using $SPDK_RPC"
sudo nvme connect -t tcp -n nqn.2025-01.io.spdk:cnode1 -a 127.0.0.1 -s 4420 || echo "Error Connecting to NVMf subsystem"
sleep 5

echo "Configuration complete."
ls /dev/nvme* > $SCRIPT_DIR/nvme.lst
diff $SCRIPT_DIR/nvme.lst $SCRIPT_DIR/nvme.lst.bak
