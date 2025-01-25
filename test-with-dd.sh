# Find the connected NVMe device
DEVICE=$(diff nvme.lst*|grep nvme | sed "s/< //")n1
echo "Finding new NVMe device $DEVICE"
ls $DEVICE || exit 1

# Create a filesystem
sudo mkfs.ext4 $DEVICE

# Mount the device
echo "Mounting $DEVICE..."
sudo rm -rf /mnt/spdk || true
sudo mkdir -p /mnt/spdk
sudo mount $DEVICE /mnt/spdk

# Write and read a test file
echo "Testing read/write operations..."
sudo dd if=/dev/zero of=/mnt/spdk/testfile bs=1M count=100
sudo sync
sudo cat /mnt/spdk/testfile > /dev/null

# Cleanup
sudo umount /mnt/spdk
echo "Read/write test complete."
