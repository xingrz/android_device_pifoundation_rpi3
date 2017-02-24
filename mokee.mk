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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit device configuration
$(call inherit-product, device/pifoundation/rpi3/device.mk)

# Inherit some common MoKee stuff.
$(call inherit-product, vendor/mk/config/common_full.mk)

PRODUCT_DEVICE := rpi3
PRODUCT_NAME := mk_rpi3
PRODUCT_BRAND := pifoundation
PRODUCT_MODEL := Raspberry Pi 3
PRODUCT_MANUFACTURER := Pi Foundation

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE="rpi3" \
    PRODUCT_NAME="rpi3"

PRODUCT_PROPERTY_OVERRIDES += \
    ro.mk.maintainer=XiNGRZ

TARGET_VENDOR := pifoundation
