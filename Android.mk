LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),xaga)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
