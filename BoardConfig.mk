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

DEVICE_PATH := device/pifoundation/rpi3

TARGET_NO_RECOVERY := true
TARGET_NO_RADIOIMAGE := true

# Bootloader
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := bcm2710

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true

# Kernel
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/mkbootimg.mk
BOARD_KERNEL_CMDLINE := dwc_otg.lpm_enable=0 console=serial0,115200 no_console_suspend root=/dev/ram0 elevator=deadline rootwait androidboot.hardware=rpi3 androidboot.selinux=permissive
BOARD_RAMDISK_OFFSET     := 0x01f00000
BOARD_KERNEL_IMAGE_NAME := zImage

TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_HEADER_ARCH := arm
TARGET_KERNEL_SOURCE := kernel/pifoundation/bcm2710
TARGET_KERNEL_CONFIG := bcm2709_defconfig
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-linux-androideabi-

# Raspberry hardware
BOARD_USES_RPI_HARDWARE := true

# Partitions
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648 # 2G
BOARD_CACHEIMAGE_PARTITION_SIZE := 134217728 # 128M
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 134217728 # 128M

TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true
TARGET_USERIMAGES_USE_EXT4 := true

BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_MALLOC_ALIGNMENT := 16

# Audio
USE_XML_AUDIO_POLICY_CONF := 1

# Display
BOARD_EGL_CFG := $(DEVICE_PATH)/egl.cfg
BOARD_GPU_DRIVERS := vc4
BOARD_USE_BGRA_8888 := true
USE_OPENGL_RENDERER := true
TARGET_USE_PAN_DISPLAY := true

# Wifi
BOARD_WLAN_DEVICE := bcmdhd
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth
BOARD_CUSTOM_BT_CONFIG := $(DEVICE_PATH)/bluetooth/vnd_rpi3.txt

# Camera
# Stub: We don't have a real camera
USE_CAMERA_STUB := true

# SELinux
BOARD_SEPOLICY_DIRS := \
    $(DEVICE_PATH)/sepolicy
