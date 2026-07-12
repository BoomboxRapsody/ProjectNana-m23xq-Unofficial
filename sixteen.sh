#!/bin/bash

if [ "$#" -lt 6 ]; then
    echo "Usage: $0 <STOCK_DEVICE> <STOCK_DEVICE_CSC> <STOCK_DEVICE_IMEI> <USE_UI_8_TETHERING_APEX> <TARGET_DEVICE> <TARGET_DEVICE_CSC> <TARGET_DEVICE_IMEI> <OUTPUT_FILESYSTEM>"
    exit 1
fi

VERSION="1"

# Device info
export STOCK_DEVICE="$1"
export STOCK_DEVICE_CSC="$2"
export STOCK_DEVICE_IMEI="$3"
export USE_UI_8_TETHERING_APEX="$4"
export TARGET_DEVICE="$5"
export TARGET_DEVICE_CSC="$6"
export TARGET_DEVICE_IMEI="$7"
export OUTPUT_FILESYSTEM="$8"

# Directories
export FIRM_STOCK_DIR="$(pwd)/FW_STOCK"
export FIRM_TARGET_DIR="$(pwd)/FW_TARGET"
export OUT_DIR="$(pwd)/OUT"
export WORK_DIR="$(pwd)/WORK"
export APKTOOL="$(pwd)/bin/java/apktool.jar"
export VNDKS_COLLECTION="$(pwd)/UltimateM23_Build/vndks"
export BUILD_PARTITIONS="product,system_ext,system"

# Source
source "$(pwd)/scripts/debloat.sh"
source "$(pwd)/scripts/Build.sh"

EXTRACT_SUPER_STOCK_IMG "$FIRM_STOCK_DIR/$STOCK_DEVICE"
EXTRACT_FIRMWARE_STOCK_IMG "$FIRM_STOCK_DIR/$STOCK_DEVICE" "all"
EXTRACT_SUPER_TARGET_IMG "$FIRM_TARGET_DIR/$TARGET_DEVICE"
EXTRACT_FIRMWARE_TARGET_IMG "$FIRM_TARGET_DIR/$TARGET_DEVICE" "all"

DECODE_STOCK_OMC "$FIRM_STOCK_DIR/$STOCK_DEVICE" "$WORK_DIR"
DECODE_TARGET_OMC "$FIRM_TARGET_DIR/$TARGET_DEVICE" "$WORK_DIR"
DEBLOAT "$FIRM_TARGET_DIR/$TARGET_DEVICE"

APPLY_STOCK_CONFIG "$FIRM_TARGET_DIR/$TARGET_DEVICE"
PATCH_SELINUX "$FIRM_TARGET_DIR/$TARGET_DEVICE"
DISABLE_SECURITY "$FIRM_TARGET_DIR/$TARGET_DEVICE"
ADD_SAMSUNG_FLAGSHIP_APPS "$FIRM_TARGET_DIR/$TARGET_DEVICE"
APPLY_CUSTOM_FEATURES "$FIRM_TARGET_DIR/$TARGET_DEVICE"

INSTALL_FRAMEWORK "$APKTOOL" "$FIRM_TARGET_DIR/$TARGET_DEVICE/system/system/framework/framework-res.apk"

DECOMPILE "$APKTOOL" "$FIRM_TARGET_DIR/$TARGET_DEVICE/system/system/framework" "$FIRM_TARGET_DIR/$TARGET_DEVICE/system/system/framework/ssrm.jar" "$WORK_DIR"
DECOMPILE "$APKTOOL" "$FIRM_TARGET_DIR/$TARGET_DEVICE/system/system/framework" "$FIRM_TARGET_DIR/$TARGET_DEVICE/system/system/framework/services.jar" "$WORK_DIR"
DECOMPILE "$APKTOOL" "$FIRM_TARGET_DIR/$TARGET_DEVICE/system/system/framework" "$FIRM_TARGET_DIR/$TARGET_DEVICE/system/system/framework/samsungkeystoreutils.jar" "$WORK_DIR"

PATCH_SSRM "$WORK_DIR/ssrm"
PATCH_FLAG_SECURE "$WORK_DIR/services"
PATCH_SECURE_FOLDER "$WORK_DIR/services"
PATCH_PRIVATE_SHARE "$WORK_DIR/samsungkeystoreutils"

RECOMPILE "$APKTOOL" "$FIRM_TARGET_DIR/$TARGET_DEVICE/system/system/framework" "$WORK_DIR/ssrm" "$WORK_DIR"
RECOMPILE "$APKTOOL" "$FIRM_TARGET_DIR/$TARGET_DEVICE/system/system/framework" "$WORK_DIR/services" "$WORK_DIR"
RECOMPILE "$APKTOOL" "$FIRM_TARGET_DIR/$TARGET_DEVICE/system/system/framework" "$WORK_DIR/samsungkeystoreutils" "$WORK_DIR"
mv -f "$WORK_DIR"/*.jar "$FIRM_TARGET_DIR/$TARGET_DEVICE/system/system/framework/"

PATCH_BT_LIB "$FIRM_TARGET_DIR/$TARGET_DEVICE" "$WORK_DIR"

B_ID="$(grep -m1 '^ro.system.build.id=' "$FIRM_TARGET_DIR/$TARGET_DEVICE/system/system/build.prop" | cut -d= -f2 | tr -d '\r')"
B_V="$(grep -m1 '^ro.system.build.version.incremental=' "$FIRM_TARGET_DIR/$TARGET_DEVICE/system/system/build.prop" | cut -d= -f2 | tr -d '\r')"
BUILD_PROP "$FIRM_TARGET_DIR/$TARGET_DEVICE" "system" "ro.build.display.id" "${B_ID} ${B_V} V-${VERSION}: Built with UltimateM23 Tools"
BUILD_PROP "$FIRM_TARGET_DIR/$TARGET_DEVICE" "product" "ro.build.display.id" "${B_ID} ${B_V} V-${VERSION}: Built with UltimateM23 Tools"

BUILD_IMG "$FIRM_TARGET_DIR/$TARGET_DEVICE" "all" "$OUTPUT_FILESYSTEM" "$OUT_DIR"
