# Board Specification
BOARD_VENDOR := xiaomi
DEVICE_PATH := device/xiaomi/xaga

# Build System
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    mi_ext \
    odm \
    odm_dlkm \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    vendor \
    vendor_boot \
    vendor_dlkm

# Verified Boot
BOARD_AVB_ENABLE := true
#BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
#BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag
#BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

BOARD_AVB_VBMETA_SYSTEM := product system system_ext
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2

BOARD_AVB_VBMETA_VENDOR := odm vendor
BOARD_AVB_VBMETA_VENDOR_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_VENDOR_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX_LOCATION := 3

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := cortex-a78
TARGET_CPU_VARIANT_RUNTIME := cortex-a78

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# Assert
TARGET_OTA_ASSERT_DEVICE := xaga,xagain,xagapro,xagaproin

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Audio
BOARD_SUPPORTS_SOUND_TRIGGER := true
BOARD_USES_ALSA_AUDIO := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := xaga
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true
TARGET_BOARD_PLATFORM := mt6895
PRODUCT_PLATFORM := xaga
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# DRM
TARGET_ENABLE_MEDIADRM_64 := true

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_xaga
TARGET_RECOVERY_DEVICE_MODULES := libinit_xaga

# Kernel
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64

BOARD_USES_GENERIC_KERNEL_IMAGE := true
TARGET_FORCE_PREBUILT_KERNEL := true

BOARD_HEADER_VERSION := 4
BOARD_HEADER_SIZE := 2128
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_RAMDISK_USE_LZ4 := true

BOARD_VENDOR_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_CMDLINE := androidboot.init_fatal_reboot_target=recovery

BOARD_VENDOR_BASE := 0x3fff8000
BOARD_PAGE_SIZE := 4096
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x26f08000
BOARD_TAGS_OFFSET := 0x07c88000
BOARD_DTB_OFFSET := 0x07c88000
BOARD_DTB_SIZE := 323130

BOARD_MKBOOTIMG_ARGS += --vendor_base $(BOARD_VENDOR_BASE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --vendor_cmdline $(BOARD_VENDOR_CMDLINE)

TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_SOURCE := kernel/xiaomi/mt6895

# Kernel Modules
# Kernel modules
BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(wildcard $(DEVICE_PATH)/prebuilts/modules/*.ko)
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/prebuilts/modules/modules.load))

# Partitions
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_DTBOIMG_PARTITION_SIZE := 33554432
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := xiaomi_dynamic_partitions
BOARD_XIAOMI_DYNAMIC_PARTITIONS_PARTITION_LIST := system product vendor odm mi_ext
BOARD_XIAOMI_DYNAMIC_PARTITIONS_PARTITION_LIST += system_ext vendor_dlkm odm_dlkm
BOARD_XIAOMI_DYNAMIC_PARTITIONS_SIZE := 9122611200

BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs

BOARD_MI_EXTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_ODM_DLKMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := erofs

TARGET_COPY_OUT_MI_EXT := mi_ext
TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_ODM_DLKM := odm_dlkm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM := system
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm

BOARD_USES_METADATA_PARTITION := true

ifneq ($(WITH_GMS),true)
BOARD_PRODUCTIMAGE_EXTFS_INODE_COUNT := -1
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 1258291200
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 1258291200
BOARD_SYSTEM_EXTIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEM_EXTIMAGE_PARTITION_RESERVED_SIZE := 524288000
else
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 104857600
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 104857600
BOARD_SYSTEM_EXTIMAGE_PARTITION_RESERVED_SIZE := 31457280
endif
BOARD_ODMIMAGE_PARTITION_RESERVED_SIZE := 31457280
BOARD_VENDORIMAGE_PARTITION_RESERVED_SIZE := 104857600

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.mt6895
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
BOARD_USES_RECOVERY_AS_BOOT := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true
TARGET_NO_RECOVERY := true
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Security patch level
VENDOR_SECURITY_PATCH := 2022-06-01

# HIDL
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/vintf/manifest.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/AHBF@2.1-service.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/android.hardware.boot@1.2.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/android.hardware.cas@1.2-service-lazy.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/android.hardware.dumpstate@1.1-service.xiaomi.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/android.hardware.health@2.1.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/android.hardware.neuralnetworks-shim-service-mtk.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/android.hardware.security.keymint-service.beanpod.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/android.hardware.security.secureclock-service.beanpod.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/android.hardware.security.sharedsecret-service.beanpod.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/android.hardware.usb@1.2-service-mediatekv2.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/android.hardware.wifi.hostapd.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/android.hardware.wifi.supplicant.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/android.hardware.wifi@1.0-service.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/fod.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/gnss-default.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/gnss@2.1-service.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/lbs_hidl_service@1.0.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/lights-mtk-default.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/manifest.microtrust.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/manifest_android.hardware.drm@1.4-service.clearkey.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/manifest_android.hardware.drm@1.4-service.widevine.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/manifest_apuware_apusys.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/manifest_apuware_hmp.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/manifest_apuware_utils.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/manifest_hwcomposer.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/manifest_media_c2_V1_1_default.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/manifest_vendor.dolby.hardware.dms.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/manifest_vendor.xiaomi.hardware.cld.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/manifest_vendor.xiaomi.hardware.otrpagent@2.0.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/memtrack-mediatek.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/power-default.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/vendor.mediatek.hardware.neuropilot.agent@1.0-service.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/vendor.xiaomi.cit.wifi@1.0_manifest.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/vendor.xiaomi.hardware.micharge@1.0.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/vendor.xiaomi.hardware.mimd@1.0-service.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/vendor.xiaomi.hardware.miperf@1.0.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/vendor.xiaomi.hardware.misys@1.0.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/vendor.xiaomi.hardware.misys@2.0.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/vendor.xiaomi.hardware.misys@3.0.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/vendor.xiaomi.hardware.misys@4.0.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/vendor.xiaomi.hardware.vibratorfeature.service.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/vendor.xiaomi.hw.touchfeature@1.0-service.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/vendor.xiaomi.sensor.citsensorservice@1.1-service.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/vendor.xiaomi.sensor.communicate@1.0_manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/vintf/compatibility_matrix.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(DEVICE_PATH)/vintf/framework_compatibility_matrix.xml
-include vendor/xiaomi/xaga/BoardConfigVendor.mk

# Sepolicy
include device/mediatek/sepolicy_vndr/SEPolicy.mk
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/public
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Vintf
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/manifest.xml
