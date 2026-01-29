# #!/bin/sh
# set -e

# BOOT_DIR="${BINARIES_DIR}/rpi-firmware"
# CONFIG_FILE="${BOOT_DIR}/config.txt"

# echo "[post-build] Ensuring custom Raspberry Pi firmware config present..."

# # Only append once — check if marker exists
# if ! grep -q "Custom Buildroot settings" "${CONFIG_FILE}"; then
#   cat <<'EOF' >> "${CONFIG_FILE}"

# # --- Custom Buildroot settings ---
# dtparam=i2c_arm=on
# dtparam=i2c_arm_baudrate=100000
# dtparam=spi=on
# enable_uart=1
# dtoverlay=i2c1,pins_2_3
# dtoverlay=ads1115-soil
# EOF
#   echo "[post-build] Appended custom lines to ${CONFIG_FILE}"
# else
#   echo "[post-build] Custom config already present — skipping append"
# fi
