LOCAL_PATH := $(call my-dir)

# libgdc
include $(CLEAR_VARS)
LOCAL_SRC_FILES := gdc.c IONmem.c
LOCAL_MODULE := libgdc
LOCAL_MODULE_TAGS := optional
LOCAL_SHARED_LIBRARIES := liblog libion
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include \
	system/core/libion/ \
	system/core/libion/include/ \
	system/core/libion/kernel-headers \
	system/core/liblog/include \
	system/memory/libion/kernel-headers/linux/
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/include
LOCAL_CFLAGS := -Werror
LOCAL_LICENSE_KINDS := legacy_by_exception_only legacy_notice SPDX-license-identifier-Apache-2.0 SPDX-license-identifier-FTL SPDX-license-identifier-GPL SPDX-license-identifier-LGPL-2.1 SPDX-license-identifier-MIT legacy_proprietary
LOCAL_LICENSE_CONDITIONS := by_exception_only notice restricted proprietary by_exception_only
LOCAL_NOTICE_FILE := $(LOCAL_PATH)/LICENSE

ifeq ($(shell test $(PLATFORM_SDK_VERSION) -ge 26 && echo OK),OK)
LOCAL_PROPRIETARY_MODULE := true
endif
include $(BUILD_SHARED_LIBRARY)

# gdc_test
include $(CLEAR_VARS)
LOCAL_PRELINK_MODULE:= false

LOCAL_ARM_MODE := arm
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES:= gdc_test.c

LOCAL_C_INCLUDES += $(LOCAL_PATH)/include \
	system/core/libion/include/ \
	system/core/libion/kernel-headers \
	system/core/liblog/include
LOCAL_SHARED_LIBRARIES := liblog libion libgdc

LOCAL_CFLAGS += -g
LOCAL_CPPFLAGS := -g

LOCAL_MODULE := gdc_test
LOCAL_LICENSE_KINDS := legacy_by_exception_only legacy_notice SPDX-license-identifier-Apache-2.0 SPDX-license-identifier-FTL SPDX-license-identifier-GPL SPDX-license-identifier-LGPL-2.1 SPDX-license-identifier-MIT legacy_proprietary
LOCAL_LICENSE_CONDITIONS := by_exception_only notice restricted proprietary by_exception_only
LOCAL_NOTICE_FILE := $(LOCAL_PATH)/LICENSE

ifeq ($(shell test $(PLATFORM_SDK_VERSION) -ge 26 && echo OK),OK)
LOCAL_PROPRIETARY_MODULE := true
endif
include $(BUILD_EXECUTABLE)

# libdewarp.so (prebuilt)
include $(CLEAR_VARS)
LOCAL_MODULE := libdewarp
LOCAL_MODULE_TAGS := optional
LOCAL_SHARED_LIBRARIES := libc++ libc libcutils libdl liblog libm
LOCAL_MULTILIB := both
LOCAL_SRC_FILES_32 := dewarp/lib/32/libdewarp.so
LOCAL_SRC_FILES_64 := dewarp/lib/64/libdewarp.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/dewarp
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_32 := $(PRODUCT_OUT)/vendor/lib
LOCAL_MODULE_PATH_64 := $(PRODUCT_OUT)/vendor/lib64


include $(BUILD_PREBUILT)

# dewarp_test
include $(CLEAR_VARS)
LOCAL_PRELINK_MODULE:= false

LOCAL_ARM_MODE := arm
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES:= dewarp/dewarp_test.c

LOCAL_C_INCLUDES += $(LOCAL_PATH)/include \
	$(LOCAL_PATH)/dewarp \
	system/core/libion/include/ \
	system/core/libion/kernel-headers \
	system/core/liblog/include
LOCAL_SHARED_LIBRARIES := liblog libion libgdc libdewarp

LOCAL_CFLAGS += -g
LOCAL_CPPFLAGS := -g

LOCAL_MODULE := dewarp_test
LOCAL_LICENSE_KINDS := legacy_by_exception_only legacy_notice SPDX-license-identifier-Apache-2.0 SPDX-license-identifier-FTL SPDX-license-identifier-GPL SPDX-license-identifier-LGPL-2.1 SPDX-license-identifier-MIT legacy_proprietary
LOCAL_LICENSE_CONDITIONS := by_exception_only notice restricted proprietary by_exception_only
LOCAL_NOTICE_FILE := $(LOCAL_PATH)/LICENSE

ifeq ($(shell test $(PLATFORM_SDK_VERSION) -ge 26 && echo OK),OK)
LOCAL_PROPRIETARY_MODULE := true
endif
include $(BUILD_EXECUTABLE)

# gdc_chip_check
include $(CLEAR_VARS)
LOCAL_PRELINK_MODULE:= false

LOCAL_ARM_MODE := arm
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES:= gdc_chip_check.c

LOCAL_C_INCLUDES += $(LOCAL_PATH)/include \
	system/core/libion/include/ \
	system/core/libion/kernel-headers \
	system/core/liblog/include
LOCAL_SHARED_LIBRARIES := liblog libion libgdc

LOCAL_CFLAGS += -g
LOCAL_CPPFLAGS := -g

LOCAL_MODULE := gdc_chip_check

ifeq ($(shell test $(PLATFORM_SDK_VERSION) -ge 26 && echo OK),OK)
LOCAL_PROPRIETARY_MODULE := true
endif
LOCAL_LICENSE_KINDS := SPDX-license-identifier-Apache-2.0 SPDX-license-identifier-FTL SPDX-license-identifier-GPL SPDX-license-identifier-LGPL-2.1 SPDX-license-identifier-MIT legacy_by_exception_only legacy_notice legacy_proprietary
LOCAL_LICENSE_CONDITIONS := by_exception_only notice restricted proprietary by_exception_only
LOCAL_NOTICE_FILE := $(LOCAL_PATH)/LICENSE
include $(BUILD_EXECUTABLE)
