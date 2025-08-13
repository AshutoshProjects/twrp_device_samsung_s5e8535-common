#
# Copyright (C) 2025 AshutoshProjects
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.
#

# Inherit common AOSP product configurations
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Enable project quotas and casefolding for emulated storage
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Inherit common TWRP configurations
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit common device configuration
$(call inherit-product, device/samsung/s5e8535-common/device.mk)

# Include charger resources
PRODUCT_PACKAGES += \
    charger_res_images

# Copy recovery root files
PRODUCT_COPY_FILES += $(call find-copy-subdir-files, *, $(COMMON_PATH)/recovery/root, recovery/root)