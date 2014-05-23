# brand
PRODUCT_BRAND ?= C-RoM

#SuperUser
SUPERUSER_EMBEDDED := true

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false \
    persist.sys.root_access=3

# selinux dialog
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Camera shutter sound property
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.camera-sound=1

# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0

# Installer
PRODUCT_COPY_FILES += \
    vendor/crom/prebuilt/common/bin/persist.sh:install/bin/persist.sh \
    vendor/crom/prebuilt/common/etc/persist.conf:system/etc/persist.conf

# packages
PRODUCT_PACKAGES += \
    BluetoothExt \
    Apollo \
    BlueBalls \
    CMFileManager \
    Trebuchet \
    CRoMAbout \
    CRoMOTA \
    DashClock \
    Development \
    DSPManager \
    Galaxy4 \
    KernelTweaker \
    libcyanogen-dsp \
    LiveWallpapers \
    LiveWallpapersPicker \
    LockClock \
    NoiseField \
    OmniSwitch \
    PhaseBeam \
    PhotoTable \
    ROMStats \
    SunBeam \
    Superuser \
    su \
    Torch \
    VoicePlus \
    audio_effects.conf \
    libemoji

# Screen recorder
PRODUCT_PACKAGES += \
    ScreenRecorder \
    libscreenrecorder

PRODUCT_PACKAGES += \
    libsepol \
    e2fsck \
    mke2fs \
    tune2fs \
    nano \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    ntfsfix \
    ntfs-3g

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libstagefright_soft_ffmpegadec \
    libstagefright_soft_ffmpegvdec \
    libFFmpegExtractor \
    libnamparser

# languages
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Themes
include vendor/crom/config/themes_common.mk

#korean
$(call inherit-product-if-exists, external/naver-fonts/fonts.mk)

# overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/crom/overlay/dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/crom/overlay/common

# bin
PRODUCT_COPY_FILES += \
    vendor/crom/prebuilt/common/bin/sysinit:system/bin/sysinit

# etc
PRODUCT_COPY_FILES += \
    vendor/crom/prebuilt/common/etc/init.crom.rc:root/init.crom.rc

# prebuilt
PRODUCT_COPY_FILES += \
    vendor/crom/prebuilt/common/xbin/sysro:system/xbin/sysro \
    vendor/crom/prebuilt/common/xbin/sysrw:system/xbin/sysrw \
    vendor/crom/prebuilt/common/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/crom/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

#backup tool
CROM_BUILD = true
PRODUCT_COPY_FILES += \
    vendor/crom/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/crom/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/crom/prebuilt/common/bin/50-crom.sh:system/addon.d/50-crom.sh \
    vendor/crom/prebuilt/common/bin/blacklist:system/addon.d/blacklist \
    vendor/crom/prebuilt/common/bin/99-backup.sh:system/addon.d/99-backup.sh \
    vendor/crom/prebuilt/common/etc/backup.conf:system/etc/backup.conf


# SunBeam LWP
PRODUCT_COPY_FILES += \
    vendor/crom/prebuilt/common/app/SunBeam.apk:system/app/SunBeam.apk

# sip/voip
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# nfc
PRODUCT_COPY_FILES += \
    vendor/crom/config/permissions/com.crom.android.xml:system/etc/permissions/com.crom.android.xml \
    vendor/crom/config/permissions/com.crom.nfc.enhanced.xml:system/etc/permissions/com.crom.nfc.enhanced.xml

# HFM Files
PRODUCT_COPY_FILES += \
        vendor/crom/prebuilt/etc/hosts.alt:system/etc/hosts.alt \
        vendor/crom/prebuilt/etc/hosts.og:system/etc/hosts.og

# version
RELEASE = false
CROM_VERSION_MAJOR = 6
CROM_VERSION_MINOR = 6


CROM_VERSION := "C-RoM-KK-v$(CROM_VERSION_MAJOR).$(CROM_VERSION_MINOR)"-$(shell date +%Y%m%d)

PRODUCT_PROPERTY_OVERRIDES += \
  ro.crom.version=$(CROM_VERSION)

# ROM Statistics and ROM Identification
PRODUCT_PROPERTY_OVERRIDES += \
ro.romstats.askfirst=1 \
ro.romstats.ga=UA-20205669-1 \
ro.romstats.name=C-RoM \
ro.romstats.url=http://stats.c-rom.org \
ro.romstats.version=$(CROM_VERSION)
