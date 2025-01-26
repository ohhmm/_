#!/bin/bash
SPDK_PATH=~/spdk

echo "Starting SPDK NVMf/TCP target from $SPDK_PATH"

sudo sysctl vm.nr_hugepages=8192
sudo $SPDK_PATH/build/bin/nvmf_tgt &
SPDK_PID=$!
sleep 2

echo "SPDK NVMf/TCP target started with PID $SPDK_PID"