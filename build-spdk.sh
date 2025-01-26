#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Downloading latest SPDK..."
# Clone the latest SPDK repository
git clone --recursive https://github.com/spdk/spdk.git
cd spdk

echo "Installing dependencies..."
# Install dependencies
sudo apt-get update
sudo apt-get install -y git gcc g++ make libcunit1-dev libaio-dev libssl-dev \
    uuid-dev libiscsi-dev python3-pip libjson-c-dev libcmocka-dev

pip3 install ninja meson

echo "Building SPDK..."
# Setup and build
git submodule update --init
git am 0001-Add-nvme-passthrough-bdev-stats.patch
./scripts/pkgdep.sh
./configure --with-shared
make -j$(nproc)

echo "Starting SPDK NVMf/TCP target..."
# Start the SPDK NVMf/TCP target application
sudo sysctl vm.nr_hugepages=8192
sudo ~/spdk/build/bin/nvmf_tgt &
SPDK_PID=$!
sleep 2

echo "SPDK NVMf/TCP target started with PID $SPDK_PID"