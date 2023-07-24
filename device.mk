#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit generic_ramdisk product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)

# Project ID Quota
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Dalvik VM Configuration
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=$(PRODUCT_SYSTEM_PARTITIONS_FILE_SYSTEM_TYPE) \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=erofs \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Audio
$(call soong_config_set,android_hardware_audio,run_64bit,true)

PRODUCT_PACKAGES += \
    android.hardware.audio@7.1-impl:64 \
    android.hardware.audio.effect@7.0-impl:64 \
    android.hardware.soundtrigger@2.3-impl:64 \
    android.hardware.audio.service

PRODUCT_PACKAGES += \
    audio.bluetooth.default \
    audio.usb.default \
    android.hardware.bluetooth.audio-impl:64

PRODUCT_PACKAGES += \
    MtkInCallService

PRODUCT_PACKAGES += \
    libaudiofoundation.vendor \
    libbluetooth_audio_session \
    libalsautils \
    libnbaio_mono \
    libtinycompress \
    libdynproc \
    libhapticgenerator

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.1.vendor

# Boot Control
PRODUCT_PACKAGES += \
    com.android.hardware.boot \
    android.hardware.boot-service.default_recovery

# Camera
PRODUCT_PACKAGES += \
    android.frameworks.displayservice@1.0.vendor:64 \
    android.hardware.camera.common@1.0.vendor:64 \
    android.hardware.camera.device@3.2.vendor:64 \
    android.hardware.camera.device@3.3.vendor:64 \
    android.hardware.camera.device@3.4.vendor:64 \
    android.hardware.camera.device@3.5.vendor:64 \
    android.hardware.camera.device@3.6.vendor:64 \
    android.hardware.camera.provider@2.4.vendor:64 \
    android.hardware.camera.provider@2.5.vendor:64 \
    android.hardware.camera.provider@2.6.vendor:64

# ConsumerIr
PRODUCT_PACKAGES += \
    android.hardware.ir-service.example

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.3-service \
    android.hardware.memtrack-service.mediatek-mali

PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@4.0.vendor \
    android.frameworks.sensorservice@1.0.vendor \
    libdrm.vendor \
    libutils-v32

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm-service.clearkey \
    android.hardware.drm@1.4.vendor

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl.custom \
    fastbootd

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3-service.xiaomi \
    vendor.xiaomi.hardware.fingerprintextension@1.0.vendor

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl:64 \
    android.hardware.gatekeeper@1.0-service

# GNSS
PRODUCT_PACKAGES += \
    android.hardware.gnss.measurement_corrections@1.1.vendor:64 \
    android.hardware.gnss.visibility_control@1.0.vendor:64 \
    android.hardware.gnss@1.1.vendor:64 \
    android.hardware.gnss@2.1.vendor:64 \
    android.hardware.gnss-V1-ndk_platform.vendor:64

# Health
PRODUCT_PACKAGES += \
    android.hardware.health-service.example \
    android.hardware.health-service.example_recovery

PRODUCT_PACKAGES += \
    android.hardware.health@1.0.vendor

# HIDL
PRODUCT_PACKAGES += \
    libhidltransport.vendor \
    libhidltransport:64 \
    libhwbinder.vendor \
    libhwbinder:64 \
    android.hidl.allocator@1.0.vendor

# IMS
PRODUCT_BOOT_JARS += \
    mediatek-common \
    mediatek-framework \
    mediatek-ims-base \
    mediatek-ims-common \
    mediatek-telecom-common \
    mediatek-telephony-base \
    mediatek-telephony-common

PRODUCT_PACKAGES += \
    libshim_sink

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-com.mediatek.ims.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-com.mediatek.ims.xml

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.0.vendor:64 \
    libkeymaster_messages.vendor:64 \
    libkeymaster_portable.vendor:64

# Keymint
PRODUCT_PACKAGES += \
    android.hardware.security.keymint-V1-ndk_platform.vendor:64 \
    android.hardware.security.secureclock-V1-ndk_platform.vendor:64 \
    android.hardware.security.sharedsecret-V1-ndk_platform.vendor:64 \
    android.hardware.security.rkp-V1-ndk.vendor:64 \
    lib_android_keymaster_keymint_utils.vendor:64 \
    libkeymint.vendor:64

PRODUCT_PACKAGES += \
    android.hardware.hardware_keystore.xml

# Light
PRODUCT_PACKAGES += \
    android.hardware.light-service.xiaomi

# Media
PRODUCT_PACKAGES += \
    libcodec2_hidl@1.1.vendor:64 \
    libcodec2_hidl@1.2.vendor:64 \
    libavservices_minijail_vendor:64 \
    libstagefright_softomx_plugin.vendor:64 \
    libsfplugin_ccodec_utils.vendor:64 \
    libcodec2_soft_common.vendor:64 \
    libstagefright_foundation-v33

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/seccomp,$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy) \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/media,$(TARGET_COPY_OUT_VENDOR)/etc)

# Modules
PRODUCT_PACKAGES += \
    init.insmod.sh \
    init.insmod.mt6833.cfg

# Overlays
PRODUCT_PACKAGES += \
    CarrierConfigOverlayGold \
    TelephonyOverlayGold \
    SettingsOverlayGold \
    TetheringResOverlayGold \
    WifiResOverlayGold

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.ese.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.uicc.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.sensor.dynamic.head_tracker.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.dynamic.head_tracker.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.aware.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.rtt.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.rtt.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service.pixel-libperfmgr \
    vendor.mediatek.hardware.mtkpower@1.2-service.stub \
    libmtkperf_client_vendor \
    libmtkperf_client

PRODUCT_PACKAGES += \
    android.hardware.power@1.2.vendor \
    vendor.mediatek.hardware.mtkpower@1.0.vendor \
    vendor.mediatek.hardware.mtkpower@1.1.vendor \
    vendor.mediatek.hardware.mtkpower@1.2.vendor

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# Properties
include $(LOCAL_PATH)/configs/props/vendor_logtag.mk

# Protobuf
PRODUCT_PACKAGES += \
    libprotobuf-cpp-lite-3.9.1-vendorcompat

# Radio
PRODUCT_PACKAGES += \
    android.hardware.radio.config@1.3.vendor \
    android.hardware.radio@1.6.vendor

# Rootdir
PRODUCT_PACKAGES += \
    fstab.mt6833 \
    fstab.mt6833.vendor_ramdisk \
    init.batterysecret.rc \
    init.connectivity.rc \
    init.modem.rc \
    init.mt6833.rc \
    init.mt6833.power.rc \
    init.mt6833.usb.rc \
    init.mtkgki.rc \
    init.project.rc \
    init.sensor_2_0.rc \
    init.recovery.mt6833.rc \
    ueventd.mt6833.rc

# Secure Element
PRODUCT_PACKAGES += \
    android.hardware.secure_element@1.2.vendor

# Sensors
PRODUCT_PACKAGES += \
    android.frameworks.sensorservice@1.0.vendor:64 \
    android.hardware.sensors-service.xiaomi-multihal \
    libsensorndkbridge \
    libshim_sensors

PRODUCT_PACKAGES += \
    sensors.dynamic_sensor_hal:64

PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/configs/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/google/pixel \
    hardware/google/interfaces \
    hardware/mediatek \
    hardware/mediatek/libmtkperf_client \
    hardware/xiaomi

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal-service.mediatek

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal_info_config.json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config.json

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.3.vendor \
    android.hardware.usb.gadget@1.1.vendor

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator-service.mediatek

# Wi-Fi
PRODUCT_PACKAGES += \
    wpa_supplicant \
    hostapd \
    libwifi-hal-wrapper \
    android.hardware.wifi-service

PRODUCT_PACKAGES += \
    android.hardware.tetheroffload.config@1.0.vendor \
    android.hardware.tetheroffload.control@1.0.vendor \
    android.hardware.tetheroffload.control@1.1.vendor

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/wifi/,$(TARGET_COPY_OUT_VENDOR)/etc/wifi)

# Inherit the proprietary files
$(call inherit-product, vendor/xiaomi/gold/gold-vendor.mk)
