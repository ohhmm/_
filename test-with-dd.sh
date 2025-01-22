# Find the connected NVMe device
DEVICE=$(lsblk -nd --output NAME | grep nvme)

# Create a filesystem
sudo mkfs.ext4 /dev/$DEVICE

# Mount the device
sudo mkdir -p /mnt/spdk
sudo mount /dev/$DEVICE /mnt/spdk

# Write and read a test file
echo "Testing read/write operations..."
sudo dd if=/dev/zero of=/mnt/spdk/testfile bs=1M count=100
sudo sync
sudo cat /mnt/spdk/testfile > /dev/null

# Cleanup
sudo umount /mnt/spdk
echo "Read/write test complete."
