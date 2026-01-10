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
IMAGE_FILE="/tmp/pi_os.img"
IMAGE_XZ="$IMAGE_FILE.xz"


# promprt for drive if not provided
if [[ $# -ge 1 ]]; then
    DEVICE="$1"
else
    lsblk
    read -rp "Enter the target device ('a' for abort):" DEVICE
fi
if [[ "$DEVICE" == "a" ]]; then
    echo "Aborted!"
    exit 1
fi



# confirm drive erasure
read -rp "$DEVICE will be overwriten. Are you sure you want to continue? (y/n):" CONFIRM
if [[ "$CONFIRM" != "y" ]]; then
    echo "Aborted!"
    exit 1
fi


# obtain image
if [[ ! -f "$IMAGE_XZ" ]]; then
    echo "Downloading image..."
    curl -L "$IMAGE_URL" -o "$IMAGE_XZ"
else
    echo "Local image found, skipping download."
fi


echo "Flashing image..."
