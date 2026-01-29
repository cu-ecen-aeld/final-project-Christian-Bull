#!/bin/sh
set -e

# Buildroot passes BINARIES_DIR as $1
BINARIES_DIR="$1"

FW_DIR="${BINARIES_DIR}/rpi-firmware"
mkdir -p "${FW_DIR}/overlays"

cp -v "${BR2_EXTERNAL_project_base_PATH}/board/raspberrypi4-64/firmware/overlays/ads1115-soil.dtbo" \
      "${FW_DIR}/overlays/ads1115-soil.dtbo"
