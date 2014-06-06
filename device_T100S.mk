$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/THL/T100S/T100S-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/THL/T100S/overlay

LOCAL_PATH := device/THL/T100S
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/recovery/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_RECOVERY_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# recovery
PRODUCT_COPY_FILES += \
    device/THL/T100S/recovery/factory_init.project.rc:recovery/root/factory_init.project.rc \
    device/THL/T100S/recovery/factory_init.rc:recovery/root/factory_init.rc \
    device/THL/T100S/recovery/fstab:recovery/root/fstab \
    device/THL/T100S/recovery/meta_init.modem.rc:recovery/root/meta_init.modem.rc \
    device/THL/T100S/recovery/meta_init.project.rc:recovery/root/meta_init.project.rc \
    device/THL/T100S/recovery/meta_init.rc:recovery/root/meta_init.rc \
    device/THL/T100S/recovery/ueventd.rc:recovery/root/ueventd.rc

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_T100S
PRODUCT_DEVICE := T100S
