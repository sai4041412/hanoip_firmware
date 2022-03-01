#
# Copyright (C) 2018-2021 ArrowOS
#
# SPDX-License-Identifier: Apache-2.0
#

#
# Copyright (C) 2018-2021 ArrowOS
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/hanoip

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := a76

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := hanoip
TARGET_NO_BOOTLOADER := true

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(DEVICE_PATH)/configs/vintf/device_framework_matrix.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/configs/vintf/compatibility_matrix.xml

# Kernel
BOARD_BOOT_HEADER_VERSION := 3
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_BINARIES := kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom androidboot.console=ttyMSM0 androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 androidboot.usbcontroller=a600000.dwc3 swiotlb=2048 loop.max_part=7 cgroup.memory=nokmem,nosocket reboot=panic_warm
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOT_HEADER_VERSION)
KERNEL_LD := LD=ld.lld
TARGET_COMPILE_WITH_MSM_KERNEL := true
TARGET_KERNEL_ADDITIONAL_FLAGS := DTC_EXT=$(shell pwd)/prebuilts/misc/linux-x86/dtc/dtc
TARGET_KERNEL_APPEND_DTB := false
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_CONFIG := vendor/hanoip_defconfig
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/motorola/sm6150

# Metadata
BOARD_USES_METADATA_PARTITION := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296 # 98304 * 1024 sde11
BOARD_DTBOIMG_PARTITION_SIZE := 25165824 # 24576 * 1024 sde15
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_METADATAIMAGE_PARTITION_SIZE := 16777216 # 16384 * 1024 sda22
BOARD_USERDATAIMAGE_PARTITION_SIZE := 115806646272 # 113092428 * 1024 sda23
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := $(BOARD_BOOTIMAGE_PARTITION_SIZE)

BOARD_MOTOROLA_DYNAMIC_PARTITIONS_PARTITION_LIST := product system vendor system_ext
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_SIZE := 4864868352
BOARD_SUPER_PARTITION_GROUPS := motorola_dynamic_partitions
BOARD_SUPER_PARTITION_SIZE := 9729736704
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext

BOARD_PARTITION_LIST := $(call to-upper, $(BOARD_MOTOROLA_DYNAMIC_PARTITIONS_PARTITION_LIST))
$(foreach p, $(BOARD_PARTITION_LIST), $(eval BOARD_$(p)IMAGE_FILE_SYSTEM_TYPE := ext4))
$(foreach p, $(BOARD_PARTITION_LIST), $(eval TARGET_COPY_OUT_$(p) := $(call to-lower, $(p))))

BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

# Platform
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := lahaina
TARGET_BOARD_PLATFORM_GPU := qcom-adreno660

# Properties
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_NO_RECOVERY := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 2
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag
BOARD_AVB_VBMETA_SYSTEM := system system_ext
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

# Sepolicy
include device/qcom/sepolicy/SEPolicy.mk

# VNDK
BOARD_VNDK_VERSION := current 
