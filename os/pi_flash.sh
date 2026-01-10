~!/bin/bash

# --------------------
# A script to flash my preffered OS version to a drive.
# - Reproducible Setup
# - Headless Server Setup
# - SSH Enabled From The Go
# - Debian By Default
# --------------------


set -euo pipefail
echo "Let the flashing begin (My clothes are still on!)..."


# harcoded url for default image
IMAGE_URL="https://downloads.raspberrypi.com/raspios_lite_arm64/images/raspios_lite_arm64-2025-12-04/2025-12-04-raspios-trixie-arm64-lite.img.xz"


# promprt for drive if not provided
if [[$# -ge 1 ]]; then
    DEVICE ="$1"
else
    read -rp "Enter the traget device:" DEVICE
fi


# confirm drive erasure
read -rp "Are you sure you want to continue? (y/n): " CONFIRM
if [[ "$CONFIRM" != "y" ]]; then
    echo "Aborted!"
    exit 1
fi
