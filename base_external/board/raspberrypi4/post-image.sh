#!/bin/bash
set -e

echo "[INFO] post-image.sh: Compiling Wi-Fi overlay..."

DTC="${HOST_DIR}/bin/dtc"
SRC_DTS="${BR2_EXTERNAL}/rootfs_overlay/boot/overlays/wifi-enable-overlay.dts"
OUT_DTBO="${BINARIES_DIR}/overlays/rpi-wifi-enable.dtbo"

mkdir -p "${BINARIES_DIR}/overlays"

if [ ! -f "${SRC_DTS}" ]; then
    echo "[ERROR] DTS not found at: ${SRC_DTS}" >&2
    exit 1
fi

# Compile .dts -> .dtbo
${DTC} -@ -I dts -O dtb -o "${OUT_DTBO}" "${SRC_DTS}"

# Copy compiled overlay into the boot partition for the image
mkdir -p "${TARGET_DIR}/boot/overlays"
cp "${OUT_DTBO}" "${TARGET_DIR}/boot/overlays/"

echo "[INFO] post-image.sh: Wi-Fi overlay compiled and installed."

GENIMAGE_CFG="${BR2_EXTERNAL}/board/raspberrypi4/genimage.cfg"
GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"

echo "[INFO] post-image.sh: Running genimage..."
rm -rf "${GENIMAGE_TMP}"

${HOST_DIR}/bin/genimage \
    --rootpath "${TARGET_DIR}" \
    --tmppath "${GENIMAGE_TMP}" \
    --inputpath "${BINARIES_DIR}" \
    --outputpath "${BINARIES_DIR}" \
    --config "${GENIMAGE_CFG}" \
    --verbosity 1

echo "[INFO] post-image.sh: genimage complete. SD card image created."
