PRODUCT_BRAND ?= classicnerd

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Required packages
PRODUCT_PACKAGES += \
    LatinIME \
    Superuser \
    su

# Optional packages
PRODUCT_PACKAGES += \
    AndroidTerm \
    EVToolbox \
    VideoEditor \
    VoiceDialer \
    Basic \
    HoloSpiralWallpaper \
    MagicSmokeWallpapers \
    NoiseField \
    Galaxy4 \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    PhaseBeam

# Utilize init.d scripts
PRODUCT_COPY_FILES += \
    vendor/cn/prebuilt/common/bin/sysinit:system/bin/sysinit \
    vendor/cn/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/cn/prebuilt/common/etc/init.d/05mountext:system/etc/init.d/05mountext \
    vendor/cn/prebuilt/common/etc/init.d/07flushdns:system/etc/init.d/07flushdns \
    vendor/cn/prebuilt/common/etc/init.d/08classicnerd_tweaks:system/etc/init.d/08classicnerd_tweaks \
    vendor/cn/prebuilt/common/etc/init.d/99complete:system/etc/init.d/99complete

# Apps2sd files
PRODUCT_COPY_FILES += \
    vendor/cn/prebuilt/common/bin/a2sd:system/bin/a2sd \
    vendor/cn/prebuilt/common/bin/fix_permissions:system/bin/fix_permissions \
    vendor/cn/prebuilt/common/xbin/bootsnd.sh:system/xbin/bootsnd.sh \
    vendor/cn/prebuilt/common/xbin/zipalign:system/xbin/zipalign \
    vendor/cn/prebuilt/common/etc/init.d/10apps2sd-redux:system/etc/init.d/10apps2sd

# Prebuilt commandline tools
PRODUCT_COPY_FILES += \
    vendor/cn/prebuilt/common/xbin/dropbear-keygen:system/xbin/dropbear-keygen \
    vendor/cn/prebuilt/common/xbin/htop:system/xbin/htop \
    vendor/cn/prebuilt/common/xbin/powertop:system/xbin/powertop \
    vendor/cn/prebuilt/common/etc/profile:system/etc/profile \
    vendor/cn/prebuilt/common/etc/terminfo/l/linux:system/etc/terminfo/l/linux \
    vendor/cn/prebuilt/common/etc/terminfo/u/unknown:system/etc/terminfo/u/unknown

PRODUCT_PACKAGE_OVERLAYS += vendor/cn/overlay/dictionaries

# Disable strict mode
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.sys.strictmode.disable=true

# Version Info
PRODUCT_VERSION_MAJOR = 0
PRODUCT_VERSION_MINOR = 1
PRODUCT_VERSION_MAINTENANCE = 1

ifneq ($(NIGHTLY),true)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.romversion=Classicnerd-$(PRODUCT_CODENAME)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)$(PRODUCT_VERSION_DEVICE_SPECIFIC)
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.romversion=Classicnerd-$(PRODUCT_CODENAME)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)$(PRODUCT_VERSION_DEVICE_SPECIFIC)-$(shell date +%m%d%Y)-NIGHTLY
endif
