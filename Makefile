ARCHS = arm64
TARGET_IPHONEOS_DEPLOYMENT_VERSION = 8.0
TARGET_STRIP_FLAGS = -u -r -s /dev/null

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = duislingrmr
duislingrmr_FILES = MRTweak.xm
duislingrmr_FRAMEWORKS = UIKit
duislingrmr_CFLAGS = -w -fobjc-arc -DALWAYS_INLINE=1 -O0 -std=c++11 -stdlib=libc++
duislingrmr_LIBRARIES = Liberation substrate c++

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += mrsettings
include $(THEOS_MAKE_PATH)/aggregate.mk
