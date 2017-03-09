THEOS_DEVICE_IP = 127.0.0.1
ARCHS = armv7 arm64
TARGET = iphone:clang:latest:latest
#CFLAGS = -fobjc-arc
#THEOS_PACKAGE_DIR_NAME = debs

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = test
RunMario_FILES = Tweak.xm
RunMario_FRAMEWORKS = UIKit
RunMario_LDFLAGS += -Wl,-segalign,4000
RunMario_CFLAGS = -w

include $(THEOS_MAKE_PATH)/tweak.mk


include $(THEOS_MAKE_PATH)/aggregate.mk
