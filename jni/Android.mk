LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libboost_filesystem
LOCAL_SRC_FILES := libboost_filesystem.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libboost_system
LOCAL_SRC_FILES := libboost_system.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := flann
LOCAL_MODULE_FILENAME := libflann
LOCAL_CFLAGS := -O2 -fPIC -w -D_FLANN_VERSION=1.6.11
LOCAL_SRC_FILES := ./flann/flann.cpp ./flann/util/logger.cpp ./flann/util/random.cpp ./flann/util/saving.cpp \
                   ./flann/nn/index_testing.cpp
LOCAL_STATIC_LIBRARIES := libboost_system
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE    := test
LOCAL_SRC_FILES := test.cpp keys2a.cpp Timing.cpp
LOCAL_STATIC_LIBRARIES := flann libboost_filesystem libboost_system
LOCAL_C_INCLUDES := $(LOCAL_PATH)
LOCAL_LDLIBS +=  -llog -ldl -lz
include $(BUILD_SHARED_LIBRARY)
