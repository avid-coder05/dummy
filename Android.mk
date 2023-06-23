LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),xaga)
include $(call all-makefiles-under,$(LOCAL_PATH))

VENDOR_SYMLINKS := \
	$(TARGET_OUT_VENDOR)/lib/hw \
	$(TARGET_OUT_VENDOR)/lib64/hw \
	$(TARGET_OUT_VENDOR)/lib/egl \
	$(TARGET_OUT_VENDOR)/lib64/egl

$(VENDOR_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	$(hide) echo "Making vendor symlink"
	@mkdir -p $(TARGET_OUT_VENDOR)/lib/hw
	@mkdir -p $(TARGET_OUT_VENDOR)/lib64/hw
	@mkdir -p $(TARGET_OUT_VENDOR)/lib/egl
	@mkdir -p $(TARGET_OUT_VENDOR)/lib64/egl
	@ln -sf audio.primary.mt6895.so $(TARGET_OUT_VENDOR)/lib/hw
	@ln -sf audio.primary.mt6895.so $(TARGET_OUT_VENDOR)/lib64/hw
	@ln -sf audio.r_submix.mt6895.so $(TARGET_OUT_VENDOR)/lib/hw
	@ln -sf audio.r_submix.mt6895.so $(TARGET_OUT_VENDOR)/lib64/hw
	@ln -sf gatekeeper.default.so $(TARGET_OUT_VENDOR)/lib/hw
	@ln -sf gatekeeper.default.so $(TARGET_OUT_VENDOR)/lib64/hw
	@ln -sf android.hardware.camera.provider@2.6-impl-mediatek.so $(TARGET_OUT_VENDOR)/lib64/hw
	@ln -sf android.hardware.graphics.allocator@4.0-impl-mediatek.so $(TARGET_OUT_VENDOR)/lib/hw
	@ln -sf android.hardware.graphics.allocator@4.0-impl-mediatek.so $(TARGET_OUT_VENDOR)/lib64/hw
	@ln -sf android.hardware.graphics.mapper@4.0-impl-mediatek.so $(TARGET_OUT_VENDOR)/lib/hw
	@ln -sf android.hardware.graphics.mapper@4.0-impl-mediatek.so $(TARGET_OUT_VENDOR)/lib64/hw
	@ln -sf arm.graphics-V1-ndk_platform.so $(TARGET_OUT_VENDOR)/lib
	@ln -sf arm.graphics-V1-ndk_platform.so $(TARGET_OUT_VENDOR)/lib64
	@ln -sf gralloc.common.so $(TARGET_OUT_VENDOR)/lib/hw
	@ln -sf gralloc.common.so $(TARGET_OUT_VENDOR)/lib64/hw 
	@ln -sf lib3a.ae.core.so $(TARGET_OUT_VENDOR)/lib
	@ln -sf lib3a.ae.core.so $(TARGET_OUT_VENDOR)/lib64
	@ln -sf lib3a.ae.so $(TARGET_OUT_VENDOR)/lib
	@ln -sf lib3a.ae.so $(TARGET_OUT_VENDOR)/lib64
	@ln -sf lib3a.af.core.so $(TARGET_OUT_VENDOR)/lib64
	@ln -sf lib3a.af.so $(TARGET_OUT_VENDOR)/lib64
	@ln -sf libaalservice.so $(TARGET_OUT_VENDOR)/lib
	@ln -sf libaalservice.so $(TARGET_OUT_VENDOR)/lib64
	@ln -sf libcam.hal3a.so $(TARGET_OUT_VENDOR)/lib64
	@ln -sf libcam.halisp.imp.v4l2.so $(TARGET_OUT_VENDOR)/lib64
	@ln -sf libcam.halsensor.hwintegration.so $(TARGET_OUT_VENDOR)/lib
	@ln -sf libcam.halsensor.hwintegration.so $(TARGET_OUT_VENDOR)/lib64
	@ln -sf libcam.halsensor.so $(TARGET_OUT_VENDOR)/lib
	@ln -sf libcam.halsensor.so $(TARGET_OUT_VENDOR)/lib64
	@ln -sf libcam.vhdr.so $(TARGET_OUT_VENDOR)/lib64
	@ln -sf libcamalgo.aihdr.so $(TARGET_OUT_VENDOR)/lib64
	@ln -sf libcamalgo.ainr.so $(ATRGET_OUT_VENDOR)/lib64
	@ln -sf libfeature.stereo.provider.so $(TARGET_OUT_VENDOR)/lib64
	@ln -sf libfeature.eis.so $(TARGET_OUT)VENDOR)/lib64
	@ln -sf libGLES_mali.so $(TARGET_OUT_VENDOR)/lib/egl
	@ln -sf libGLES_mali.so $(TARGET_OUT_VENDOR)/lib64/egl
	@ln -sf libgpudataproducer.so $(TARGET_OUT_VENDOR)/lib
	@ln -sf libgpudataproducer.so $(TARGET_OUT_VENDOR)/lib64
	@ln -sf libispfeature_mtkcam.v4l2.so $(TARGET_OUT_VENDOR)/lib64
	@ln -sf libmtkcam_hal_hidl_common.so $(TARGET_OUT_VENDOR)/lib64
	@ln -sf libmtkcam_hal_hidl_device.so $(TARGET_OUT_VENDOR)/lib64
	@ln -sf libmtkcam_hal_hidl_utils.so $(TARGET_OUT_VENDOR)/lib64
	@ln -sf libmtkcam_hal_hidl_provider.so $(TARGET_OUT_VENDOR)/lib64
	@ln -sf libneuralnetworks_sl_driver_mtk_prebuilt.so $(TARGET_OUT_VENDOR)/lib
	@ln -sf libneuralnetworks_sl_driver_mtk_prebuilt.so $(TARGET_OUT_VENDOR)/lib64
	@ln -sf libvcodecdrv.so $(TARGET_OUT_VENDOR)/lib
	@ln -sf libSoftGatekeeper.so $(TARGET_OUT_VENDRO)/lib/hw/gatekeeper.default.so
	@ln -sf libSoftGatekeeper.so $(TARGET_OUT_VENDOR)/lib64/gatekeeper.default.so
	@ln -sf libmtkcam_android_zslprocessor.so $(TARGET_OUT_VENDOR)/lib64
	@ln -sf libmtkcam_hal_android_app_cbadaptor.so $(TARGET_OUT_VENDOR)/lib64
	@ln -sf libmtkcam_hal_anrdoid_common.so $(TARGET_OUT_VENDOR)/lib64
	@ln -sf libmtkcam_hal_android_device.so $(TARGET_OUT_VENDOR)/lib64
	@ln -sf libmtkcam_hal_android_provider.so $(TARGET_OUT_VENDOR)/lib64
	@ln -sf libmtkcam_hal_android_utils.so $(TARGET_OUT_VENDOR)/lib64
	@ln -sf libmtkcam_hwutils_android.so $(TARGET_OUT_VENDOR)/lib64
	@ln -sf sensors.mt6895.so $(TARGET_OUT_VENDOR)/lib64/hw
	@ln -sf vulkan.mali.so $(TARGET_OUT_VENDOR)/lib/hw
	@ln -sf vulkan.mali.so $(TARGET_OUT_VENDOR)/lib64/hw

ALL_DEFAULT_INSTALLED_MODULES += $(VENDOR_SYMLINKS)

endif
