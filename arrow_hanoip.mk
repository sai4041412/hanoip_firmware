#
# Copyright (C) 2018-2021 ArrowOS
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit common products
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit device configurations
$(call inherit-product, device/motorola/hanoip/device.mk)

# Inherit common ArrowOS configurations
$(call inherit-product, vendor/arrow/config/common.mk)

PRODUCT_CHARACTERISTICS := nosdcard

PRODUCT_BRAND := motorola
PRODUCT_DEVICE := hanoip
PRODUCT_MANUFACTURER := motorola
PRODUCT_MODEL := moto g(60)
PRODUCT_NAME := arrow_hanoip

# Build info
BUILD_FINGERPRINT := "motorola/hanoip_retail/hanoip:11/RRI31.Q1-42-48/222fd:user/release-keys"
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=hanoip_retail \
    PRIVATE_BUILD_DESC="hanoip_retail-user 11 RRI31.Q1-42-48 222fd release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-motorola
