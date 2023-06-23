
# Inherit proprietary files
$(call inherit-product, vendor/xiaomi/xaga/xaga-vendor.mk)

# Install gsi keys into ramdisk, to boot a GSI with verified boot
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Enable updating of APEXs
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# $(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)

# Setup Dalvik vm config
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

PRODUCT_SHIPPING_API_LEVEL := 31

DEVICE_PACKAGE_OVERLAYS += \
	$(LOCAL_PATH)/overlay

# A/B
ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

$(call inherit-product, vendor/xiaomi/xaga/xaga-vendor.mk)

AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vendor \
    odm \
    mi_ext

PRODUCT_PACKAGES += \
    otapreopt_script \
    update_engine \
    update_engine_sideload \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true


PRODUCT_PACKAGES += \
	checkpoint_gc \
	otapreopt_script

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml

PRODUCT_PACKAGES += \
    $(LOCAL_PATH)/configs/audio/audio_device.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_device.xml \
    $(LOCAL_PATH)/configs/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/configs/audio/audio_em.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_em.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration_a2dp_offload_disabled.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_a2dp_offload_disabled.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration_a2dp_offload_disabled_cg_enabled.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_a2dp_offload_disabled_cg_enabled.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration_a2dp_offload_enable_cg_enable.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_a2dp_offload_enable_cg_enable.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration_bluetooth_legacy_hal.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_bluetooth_legacy_hal.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml

PRODUCT_PACKAGES += \
    $(LOCAL_PATH)/configs/audio/misound_res.bin:$(TARGET_COPY_OUT_VENDOR)/etc/misound_res.bin \
    $(LOCAL_PATH)/configs/audio/misound_res_headphone.bin:$(TARGET_COPY_OUT_VENDOR)/etc/misound_res_headphone.bin \
    $(LOCAL_PATH)/configs/audio/misound_res_spk.bin:$(TARGET_COPY_OUT_VENDOR)/etc/misound_res_spk.bin \
    $(LOCAL_PATH)/configs/audio/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/usb_audio_accessory_only_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_accessory_only_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

PRODUCT_PACKAGES += \
    android.hardware.audio.common@6.0-util \
    android.hardware.audio.common@7.0-util \
    android.hardware.audio.common@7.0-enums \
    android.hardware.audio.common-util \
    android.hardware.audio.common-V1-ndk \
    android.hardware.audio.effect@6.0-util \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.audio.effects@7.0-util \
    android.hardware.audio@6.0-impl \
    android.hardware.audio@7.0-impl \
    android.hardware.soundtrigger@2.3-impl \
    android.hardware.audio.service.mediatek \
    audio.primary.mediatek \
    audio.r_submix.mediatek \
    audio.usb.default \
    audio_policy.stub \
    libaudiopreprocessing \
    libaaudio \
    libaudioclient_aidl_conversion \
    libaudiohal@7.1 \
    libaudiohal@7.0 \
    libaudiohal@6.0 \
    libfvaudio \
    libbundlewrapper \
    libdownmix \
    libdynproc \
    libeffectproxy \
    libldnhncr \
    libreverbwrapper \
    libvisualizer \
    libaudiofoundation.vendor \
    libtinycompress

PRODUCT_PACKAGES += \
    android.hardware.soundtrigger@2.0 \
    android.hardware.soundtrigger@2.1 \
    android.hardware.soundtrigger@2.2

# Bluetooth
PRODUCT_PACKAGES += \
	android.hardware.bluetooth@1.0 \
	android.hardware.bluetooth@1.1 \
	android.hardware.blueooth@1.1-impl-mediatek \
    android.hardware.bluetooth@1.1.vendor
    
PRODUCT_PACKAGES += \
	audio.bluetooth.default \
	libbluetooth_audio_session_mediatek \
	libbluetoothem_mtk \
	libbluetooth_mtk \
	libbluetooth_mtk_pure \
	libbluetooth_relayer

PRODUCT_PACKAGES += \
	android.hardware.bluetooth.audio@2.0 \
    android.hardware.bluetooth.audio@2.0-impl \
    android.hardware.bluetooth.audio@2.0 \
    android.hardware.bluetooth.audio@2.1-impl \
    android.hardware.bluetooth.audio-V2-ndk

PRODUCT_PACKAGES += \
	$(LOCAL_PATH)/configs/audio/bluetooth_a2dp_offload_ums_offload_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_a2dp_offload_ums_offload_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/bluetooth_offload_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_offload_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/bluetooth_ums_offload_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_ums_offload_audio_policy_configuration.xml

# Boot Animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Boot control HAL
PRODUCT_PACKAGES += \
    bootctrl.default \
    android.hardware.boot@1.2 \
    android.hardware.boot@1.2-service \
    android.hardware.boot@1.0-impl-1.2-mtkimpl	

# Camera
PRODUCT_PACKAGES += \
	android.hardware.camera.common@1.0 \
	anrdoid.hardware.camera.common-V1-ndk \
	android.hardware.camera.device@3.7 \
	android.hardware.camera.device-V1-ndk \
	android.hardware.camera.metadata@3.6 \
	android.hardware.camera.metadata-V1-ndk \
	android.hardware.camera.provider@2.6-impl-mediatek \
	android.hardware.camera.provider@2.7 \
	android.hardware.camera.provider-V1-ndk

PRODUCT_PACKAGES += \
	libcamera.custom.af_assist_buf_mgr \
	libcamera.custom.af_assist_buf_mgr_open \
	libcamera.custom.af_assist_mgr \
	libcamera.custom.af_assist_pdp \
	libcamera.customae \
	libcamera.customaf \
	libcamera.customawb \
	libcamera.customflk \
	libcameracustom.camera.3a \
	libcameracustom.camera.isp \
	libcameracustom.camera.sensors \
	libopencl-camera \
	libcam.halsensor.hwintegration \
	libcam.halsensor \
	libcam.hal3a.v3.sensor.v4l2 \
	libcameracustom.imgsensor \
	libcamerasensorinfoxiaomi \
	libmtkcam_sensorcontrol

# CAS
PRODUCT_PACKAGES += \
	android.hardware.cas@1.2-service-lazy

# Display
PRODUCT_PACKAGES += \
	android.hardware.graphics.allocator@4.0 \
	android.hardware.graphics.allocator@4.0-impl-mediatek \
	android.hardware.graphics.allocator-service-mediatek.mt6895 \
	android.hardware.graphics.allocator-V1-ndk \
	android.hardware.graphics.bufferqueue@2.0 \
	android.hardware.graphics.commmon@1.2 \
	android.hardware.graphics.common-V3-ndk \
	android.hardware.graphics.composer3-V1-ndk \
	android.hardware.graphics.composer@2.4 \
	android.hardware.graphics.composer@2.3-service \
	android.hardware.graphics.composer@2.2-resources \
	android.hardware.graphics.mapper@4.0 \
	android.hardware.graphics.mapper@4.0-impl-mediatek \
	android.hardware.memtrack-service.mediatek \
	android.hardware.memtrack@1.0 \
	android.hardware.memtrack-V1-ndk

PRODUCT_PACKAGES += \
	libjnigraphics \
	libgralloc_extra \
	libgralloc_extra_sys \
	libgralloc_metadata \
	libgralloctypes_mtk \
	libgraphicsenv \
	libmemtrack

PRODUCT_PACKAGES += \
	libGLES_mali \
	libGLES_meow \
	libGLESv1_CM \
	libGLESv3

# Dolby
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/privapp-com.dolby.daxappui.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-com.dolby.daxappui.xml \
    $(LOCAL_PATH)/configs/permissions/privapp-com.dolby.daxservice.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-com.dolby.daxservice.xml \
    $(LOCAL_PATH)/configs/sysconfig/config-com.dolby.daxappui.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/config-com.dolby.daxappui.xml \
    $(LOCAL_PATH)/configs/sysconfig/config-com.dolby.daxservice.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/config-com.dolby.daxservice.xml \
    $(LOCAL_PATH)/configs/sysconfig/hiddenapi-com.dolby.daxservice.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/hiddenapi-com.dolby.daxservice.xml

PRODUCT_PACKAGES += \
	dolbycodec2

# DRM
PRODUCT_PACKAGES += \
	android.hardware.drm@1.4-service.clearkey \
	android.hardware.drm@1.4 \
	android.hardware,drm-V1-ndk

PRODUCT_PACKAGES += \
	libdrm \
	libdrmclearkeyplugin \
	libdrmframework \
	libdrmframeworkcommon \
	libdrmframework_jni \
	libdrmmtkutil \
	libdrmmtkwhitelist

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Exclude sensor from InputManager
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/excluded-input-devices.xml:system/etc/excluded-input-devices.xml \

# Fingerprint
PRODUCT_PACKAGES += \
	libgoodixhwfingerprint

# Gatekeeper
PRODUCT_PACKAGES += \
	android.hardware.gatekeeper@1.0 \
	android.hardware.gatekeeper@1.0-impl \
	android.hardware.gatekeeper@1.0-service

# GPS
PRODUCT_PACKAGES += \
	android.hardware.gnss.measurement_corrections@1.1 \
	android.hardware.gnss.visibility_control@1.0 \
	android.hardware.gnss@2.1 \
	android.hardware.gnss@2.1-impl-mediatek \
	android.hardware.gnss-impl-mediatek \
	android.hardware.gnss-service.mediatek

PRODUCT_PACKAGES += \
	libservices.core-gnss

# HIDL
PRODUCT_PACKAGES += \
	android.hidl.allocator@1.0 \
	android.hidl.allocator@1.0-service \
	android.hidl.memory.block@1.0 \
	android.hidl.memory.token@1.0 \
	android.hidl.memory@1.0 \
	android.hidl.memory@1.0-impl \
	android.hidl.token@1.0 \
	android.hidl.token@1.0-utils

PRODUCT_PACKAGES += \
	libhwbinder \
	libhwui  \
	libhidlbase \
	libhidlmemory \
	libhidltransport


# IDC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/idc/uinput-fpc.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-fpc.idc \
    $(LOCAL_PATH)/configs/idc/uinput-goodix.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-goodix.idc \

# IMS
PRODUCT_BOOT_JARS += \
	mediatek-common \
	mediatek-framework \
	mediatek-ims-base \
	mediatek-ims-common \
	mediatek-services \
	mediatek-telecom-common \
	mediatek-telephony-base \
	mediatek-telephony-common

# Init
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/etc/fstab.emmc:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.emmc \
	$(LOCAL_PATH)/rootdir/etc/fstab.enableswap:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.enableswap \
	$(LOCAL_PATH)/rootdir/etc/fstab.mt6895:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.mt6895

# IR
PRODUCT_PACKAGES += \
	android.hardware.ir@1.0 \
	android.hardware.ir@1.0-impl \
	android.hardware.ir@1.0-service

# Keymaster
PRODUCT_PACKAGES += \
	android.hardware.keymaster@4.1 \
	lib_android_keymaster_keymint_utils \
	libkeymaster4_1support \
	libkeymaster4support \
	libkeymaster_messages \
	libkeymaster_portable \
	libpuresoftkeymasterdevice

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/configs/keylayout/uinput-goodix.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-goodix.kl \

# Light
PRODUCT_PACKAGES += \
	android.hardware.light@2.0 \
	android.hardware.lights-service.mediatek

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_c2.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_dolby_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_dolby_audio.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_mediatek_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_mediatek_audio.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_system_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_system_default.xml \
    $(LOCAL_PATH)/configs/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \

PRODUCT_PACKAGES += \
	android.hardware.media.c2@1.2 \
	android.hardware.media.c2@1.2-mediatek \
	android.hardware.media.c2@1.2-mediatek-64b

PRODUCT_PACKAGES += \
	libcodec2 \
	libcodec_client \
	libcodec2_hidl@1.2 \
	libcodec2_hidl_client@1.2 \
	libcodec2_hidl_plugin \
	libcodec2_mtk_c2store \
	libcodec2_mtk_vdec \
	libcodec2_mtk_venc \
	libcodec2_vndk \
	libavservices_minijail \
	libavservices_minijail_vendor \
	libminijail \
	libsfplugin_ccodec \
	libsfplugin_ccodec_utils \
	libstagefright_codecbase

# NFC
PRODUCT_PACKAGES += \
	android.hardware.nfc@1.2 \
	com.android.nfc_extras \
	com.mxpmnfc.nq \
	nfc_nci.nqx.default.hw.v1 \
	libchrome \
	NfcNci-v1 \
	SecureElement \
	Tag

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# OMX
PRODUCT_PACKAGES += \
	android.hardware.media.omx@1.0 \
	android.hardware.media.omx@1.0-service

PRODUCT_PACKAGES += \
	libmedia_omx \
	libmedia_omx_client \
	libMtkOmxCore \
	libstagefright_omx \
	libstagefright_omx_utils \
	libstagefright_softomx

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.faketouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.faketouch.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.hardware_keystore.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.hardware_keystore.xml \
    frameworks/native/data/etc/android.hardware.keystore.app_attest_key.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.keystore.app_attest_key.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.microphone.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.microphone.xml \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
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
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_3.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2022-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2022-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \

# Power
PRODUCT_PACKAGES += \
	android.hardware.power.stats@1.0 \
	android.hardware.power.stats-V1-ndk \
	android.hardware.power@1.3 \
	android.hardware.power-service-mediatek

PRODUCT_PACKAGES += \
	libpower \
	libpowerhal \
	libpowerhalwrap \
	libpowerhalwrap_jni \
	libpowerhalwrap_vendor \
	libpowerkeeper_jni \
	libpowermanager \
	power.default

# Priv-app Permissions
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/privapp-permissions-mediatek.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-mediatek.xml

# Protobuf
PRODUCT_PACKAGES += \
	libprotobuf-cpp-full-3.9.1 \
	libprotobuf-cpp-lite-3.9.1

# Public Libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt \

# Radio
PRODUCT_PACKAGES += \
	android.hardware.broadcastradio@1.1 \
	android.hardware.radio.config@1.3 \
	android.hardware.radio@1.6 \
	android.hardware.radio-V1-ndk

PRODUCT_PACKAGES += \
	libradio_metadata

# Renderscript
PRODUCT_PACKAGES += \
	android.renderscript@1.0-impl

# Rootdir
PRODUCT_PACKAGES += \
    factory_init.connectivity.common.rc \
    factory_init.connectivity.rc \
    factory_init.project.rc \
    factory_init.rc \
    init.aee.rc \
    init.batterysecret.rc \
    init.bt_drv.rc \
    init.cgroup.rc \
    init.charge_logger.rc \
    init.connectivity.common.rc \
    init.connectivity.rc \
    init.mi_thermald.rc \
    init.modem.rc \
    init.mt6895.usb.rc \
    init.mtkgki.rc \
    init.project.rc \
    init.sensor_2_0.rc \
    init_conninfra.rc \
    meta_init.connectivity.common.rc \
    meta_init.connectivity.rc \
    meta_init.modem.rc \
    meta_init.project.rc \
    meta_init.rc \
    multi_init.rc \
    fstab.emmc \
    fstab.enableswap \
    fstab.mt6895 \
    ueventd.rc

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/etc/init.mt6895.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.6895.rc

# Screen density
PRODUCT_AAPT_CONFIG := xxxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi

# Seccomp
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/seccomp/android.hardware.media.c2@1.2-extended-seccomp-policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/android.hardware.media.c2@1.2-extended-seccomp-policy \
    $(LOCAL_PATH)/configs/seccomp/android.hardware.media.c2@1.2-mediatek-seccomp-policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/android.hardware.media.c2@1.2-mediatek-seccomp-policy \
    $(LOCAL_PATH)/configs/seccomp/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    $(LOCAL_PATH)/configs/seccomp/mediaextractor.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy \
    $(LOCAL_PATH)/configs/seccomp/mediaswcodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaswcodec.policy

# Secure element
PRODUCT_PACKAGES += \
	android.hardware.secure_element@1.2

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

PRODUCT_PACKAGES += \
	android.hardware.sensors@2.0-ScopedWakeLock \
	android.hardware.sensors@2.0-service.multihal-mediatek \
	android.hardware.sensors@2.1 \
	android.hardware.sensor@2.X-subhal-mediatek

# Sound trigger
PRODUCT_PACKAGES += \
	android.hardware.soundtrigger@2.3 \
	android.hardware.soundtrigger@2.3-impl

# Tethering
PRODUCT_PACKAGES += \
	libtextclassifier_hash

# Thermal
PRODUCT_PACKAGES += \
	android.hardware.thermal@2.0 \
	android.hardware.thermal@2.0-impl

# USB
PRODUCT_PACKAGES += \
	android.hardware.usb.gadget@1.1 \
	android.hardware.usb@1.3

#Vendor Service
PRODUCT_PACKAGES += \
	vndservice \
	vndservicemanager

# VNDK
PRODUCT_PACKAGES += \
    libutils-v32

# WiFi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/passpointProfile.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/passpointProfile.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

# Test Config
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/xaga.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/device_features

# Inherit vendor
$(call inherit-product, vendor/xiaomi/xaga/xaga-vendor.mk)
