#!/bin/bash

# --------------------
# A script to flash my preffered OS version to a drive.
# - Reproducible Setup
# - Headless Server Setup
# - SSH Enabled From The Go
# - Pi OS Lite By Default
# --------------------


set -euo pipefail
echo "Let the flashing begin (My clothes are still on!)..."


# harcoded defaults
IMAGE_URL="https://downloads.raspberrypi.com/raspios_lite_arm64/images/raspios_lite_arm64-2025-12-04/2025-12-04-raspios-trixie-arm64-lite.img.xz"
IMAGE_XZ="/tmp/pi_os_img.xz"


# promprt for drive if not provided
if [[ $# -ge 1 ]]; then
    DEVICE="$1"
else
    echo "---DEVICE LIST---"
    lsblk
    read -rp "Enter the target device ('a' for abort):" DEVICE
fi
if [[ "$DEVICE" == "a" ]]; then
    echo "Error: Aborted!"
    exit 1
elif [[ ! -b "/dev/$DEVICE" ]]; then
    echo "Error: Device $DEVICE does not exist."
    exit 1
fi
DEVICE="/dev/$DEVICE"


# confirm drive erasure
read -rp "$DEVICE will be overwriten. Are you sure you want to continue? (y/n):" CONFIRM
if [[ "$CONFIRM" != "y" ]]; then
    echo "Error: Aborted!"
    exit 1
fi


# obtain image
if [[ ! -f "$IMAGE_XZ" ]]; then
    echo "Downloading image..."
    curl -L "$IMAGE_URL" -o "$IMAGE_XZ"
else
    echo "Local image found, skipping download."
fi


# decompress and pipe to drivewrite
echo "Decompressing and flashing image..."
xzcat "$IMAGE_XZ" | sudo dd of="$DEVICE" bs=4M status=progress conv=fsync
sync


# ssh and hostname
echo "Enabling network defaults..."
BOOT_PART=$(lsblk -lnpo NAME,TYPE "$DEVICE" | grep part | head -n1 | awk '{print $1}')
sudo mount "$BOOT_PART" /mnt

sudo touch /mnt/ssh
echo "SSH enabled"

read -rp "Enter hostname for Pi (default: raspi5): " HOSTNAME_INPUT
HOSTNAME=${HOSTNAME_INPUT:-raspi5}

echo "$HOSTNAME" | sudo tee /mnt/hostname > /dev/null
echo "Hostname set to $HOSTNAME"

sudo umount /mnt
