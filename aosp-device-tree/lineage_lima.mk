#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from lima device
$(call inherit-product, device/motorola/lima/device.mk)

PRODUCT_DEVICE := lima
PRODUCT_NAME := lineage_lima
PRODUCT_BRAND := motorola
PRODUCT_MODEL := motorola one macro
PRODUCT_MANUFACTURER := motorola

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="lima_retail-user 10 QMDS30.47-33-5 7e278 release-keys"

BUILD_FINGERPRINT := motorola/lima_retail/lima:10/QMDS30.47-33-5/7e278:user/release-keys
