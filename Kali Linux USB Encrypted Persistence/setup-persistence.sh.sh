#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" &> /dev/null
}

#1 Check if the required commands are available
for cmd in fdisk cryptsetup mkfs.ext3 e2label mkdir mount touch vim; do
    if ! command_exists "$cmd"; then
        echo "Error: $cmd is not installed. Please install it first."
        exit 1
    fi
done

# Step 2: Run sudo fdisk -l to list disk partitions
echo "Running 'sudo fdisk -l' to list disk partitions..."
sudo fdisk -l

# Step 3: Ask the user to manually input the disk location
echo "Please enter the disk location (e.g., /dev/sda2):"
read disk_location

# Check if the disk location exists
if [ ! -b "$disk_location" ]; then
    echo "Error: $disk_location does not exist or is not a valid block device. Exiting."
    exit 1
fi

# Step 4: Encrypt the disk with LUKS format
echo "Encrypting $disk_location with LUKS format..."
sudo cryptsetup --verbose --verify-passphrase luksFormat "$disk_location"

# Step 5: Open the encrypted disk
echo "Opening the encrypted disk..."
sudo cryptsetup luksOpen "$disk_location" encData

# Step 6: Format the encrypted disk
echo "Formatting the encrypted disk as ext3..."
sudo mkfs.ext3 /dev/mapper/encData

# Step 7: Label the encrypted disk as "persistence"
echo "Labeling the encrypted disk as 'persistence'..."
sudo e2label /dev/mapper/encData persistence

# Step 8: Create a mount point for the encrypted disk
echo "Creating mount point /mnt/encData..."
sudo mkdir -p /mnt/encData

# Step 9: Mount the encrypted disk
echo "Mounting the encrypted disk to /mnt/encData..."
sudo mount /dev/mapper/encData /mnt/encData

# Step 10: Create the persistence.conf file
echo "Creating persistence.conf file..."
cd /mnt/encData
sudo touch persistence.conf

# Step 11: Open persistence.conf and add / union
echo "Adding '/ union' to persistence.conf..."
echo "/ union" | sudo tee -a /mnt/encData/persistence.conf > /dev/null

echo "Content added to persistence.conf successfully!"

# Step 12: Finish
echo "Encrypted persistence setup complete!"
