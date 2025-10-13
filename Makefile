FINALPACKAGE=1
GO_EASY_ON_ME=1
# INSTALL_TARGET_PROCESSES = SpringBoard
TARGET = iphone:clang:latest:15.0
ARCHS = arm64
# PACKAGE_FORMAT=none
THEOS_PACKAGE_SCHEME=rootless
include $(THEOS)/makefiles/common.mk

TARGET_CC = xcrun -sdk iphoneos clang
TARGET_CXX = xcrun -sdk iphoneos clang++
TARGET_LD = xcrun -sdk iphoneos clang++

TWEAK_NAME = PrisonFLEX
FLEX_FILES := $(shell find src -type f -name "*.m" -o -name "*.mm" -o -name "*.c")

PrisonFLEX_FILES = Tweak.x $(FLEX_FILES)
PrisonFLEX_CFLAGS = -Isrc -fobjc-arc -Wno-deprecated-declarations -Wno-strict-prototypes -Wno-unsupported-availability-guard -Wno-unused-but-set-variable

PrisonFLEX_FRAMEWORKS = UIKit CoreGraphics QuartzCore ImageIO WebKit Security SceneKit AVFoundation UserNotifications
PrisonFLEX_LDFLAGS += -lz -lsqlite3

include $(THEOS_MAKE_PATH)/tweak.mk
