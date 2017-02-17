# Copyright (C) 2017 The MoKee Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Overlays
DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Device was launched with M
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.first_api_level=23

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Dalvik/HWUI
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# Audio
PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:system/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:system/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:system/etc/audio_policy_volumes.xml \
    frameworks/av/media/libeffects/data/audio_effects.conf:system/etc/audio_effects.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio_policy_configuration.xml:system/etc/audio_policy_configuration.xml

PRODUCT_PACKAGES += \
    audio.primary.rpi3 \
    audio.usb.default

# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# Display
PRODUCT_PACKAGES += \
    libGLES_mesa \
    gralloc.rpi3 \
    hwcomposer.rpi3

# Firmware
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/firmware/brcm/brcmfmac43430-sdio.bin:root/lib/firmware/brcm/brcmfmac43430-sdio.bin \
    $(LOCAL_PATH)/firmware/brcm/brcmfmac43430-sdio.txt:root/lib/firmware/brcm/brcmfmac43430-sdio.txt \
    $(LOCAL_PATH)/firmware/brcm/BCM43430A1.hcd:root/lib/firmware/brcm/BCM43430A1.hcd


# Media
PRODUCT_COPY_FILES += \
    device/generic/goldfish/camera/media_codecs.xml:system/etc/media_codecs.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rpi3_core_hardware.xml:system/etc/permissions/rpi3_core_hardware.xml

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.rpi3.rc:root/init.rpi3.rc \
    $(LOCAL_PATH)/init.usb.rc:root/init.usb.rc \
    $(LOCAL_PATH)/ueventd.rpi3.rc:root/ueventd.rpi3.rc \
    $(LOCAL_PATH)/fstab.rpi3:root/fstab.rpi3

# Wi-Fi
PRODUCT_COPY_FILES += \
    hardware/broadcom/wlan/bcmdhd/config/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \

PRODUCT_PACKAGES += \
    wpa_supplicant \
    wpa_supplicant.conf
