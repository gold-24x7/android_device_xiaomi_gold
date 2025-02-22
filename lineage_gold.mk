#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from gold device
$(call inherit-product, device/xiaomi/gold/device.mk)

PRODUCT_DEVICE := gold
PRODUCT_NAME := lineage_gold
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Redmi Note 13 5G
PRODUCT_MANUFACTURER := xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="gold-user 14 UP1A.231005.007 V816.0.15.0.UNQINXM release-keys"

BUILD_FINGERPRINT := Redmi/vnd_gold/gold:12/UP1A.231005.007/V816.0.15.0.UNQINXM:user/release-keys
