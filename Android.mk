LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),xaga)

include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)

VENDOR_BIN_SYMLINK := $(strip $(shell cat $(LOCAL_PATH)/symlink/bin.txt))

$(VENDOR_BIN_SYMLINK):$(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf $(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(VENDOR_BIN_SYMLINK)

VENDOR_ETC_SYMLINK := $(TARGET_OUT_VENDOR)/etc

$(VENDOR_ETC_SYMLINK):$(LOCAL_INSTALLED_MODULE)
	@mkdir $(TARGET_OUT_VENDOR)/etc
	$(hide) ln -sf mdota

ALL_DEFAULT_INSTALLED_MODULES += $(VENDOR_ETC_SYMLINK)

VENDOR_LIB_SYMLINK := $(strip $(shell cat $(LOCAL_PATH)/symlink/lib.txt))

$(VENDOR_LIB_SYMLINK):$(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf $(notdir $@) $@

ALL_INSTALLED_MODULES += $(VENDOR_LIB_SYMLINK)

VENDOR_LIB64_SYMLINK := $(strip $(shell cat $(LOCAL_PATH)/symlink/lib64.txt))

$(VENDOR_LIB64_SYMLINK):$(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ls -sf $(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(VENDOR_LIB64_SYMLINK)	

endif
