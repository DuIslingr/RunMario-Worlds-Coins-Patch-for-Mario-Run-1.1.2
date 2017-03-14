ARCHS = arm64
TARGET_IPHONEOS_DEPLOYMENT_VERSION = 8.0
ADDITIONAL_OBJCFLAGS = -fvisibility=hidden -fobjc-arc

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = mrsettings
mrsettings_FILES = mrsettings.mm
mrsettings_INSTALL_PATH = /Library/PreferenceBundles
mrsettings_FRAMEWORKS = UIKit
mrsettings_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/mrsettings.plist$(ECHO_END)
