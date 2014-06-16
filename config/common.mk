# brand
PRODUCT_BRAND ?= C-RoM

# Embed SuperUser
SUPERUSER_EMBEDDED := true

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

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
    ro.com.android.dataroaming=false
    persist.sys.root_access=3

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Disable excessive dalvik debug messages
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.debug.alloc=0

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/crom/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/crom/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/crom/prebuilt/common/bin/50-crom.sh:system/addon.d/50-crom.sh \
    vendor/crom/prebuilt/common/bin/99-backup.sh:system/addon.d/99-backup.sh \
    vendor/crom/prebuilt/common/etc/backup.conf:system/etc/backup.conf

# SLIM-specific init file
PRODUCT_COPY_FILES += \
    vendor/crom/prebuilt/common/etc/init.local.rc:root/init.crom.rc

# Copy libgif for Nova Launcher 3.0
PRODUCT_COPY_FILES += \
    vendor/crom/prebuilt/common/lib/libgif.so:system/lib/libgif.so

# Copy latinime for gesture typing
PRODUCT_COPY_FILES += \
    vendor/crom/prebuilt/common/lib/libjni_latinime.so:system/lib/libjni_latinime.so

# SELinux filesystem labels
PRODUCT_COPY_FILES += \
    vendor/crom/prebuilt/common/etc/init.d/50selinuxrelabel:system/etc/init.d/50selinuxrelabel

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/crom/prebuilt/common/etc/mkshrc:system/etc/mkshrc \
    vendor/crom/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf

PRODUCT_COPY_FILES += \
    vendor/crom/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/crom/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit \
    vendor/crom/prebuilt/common/bin/sysinit:system/bin/sysinit

PRODUCT_COPY_FILES += \
    vendor/crom/prebuilt/common/etc/init.d/01zipalign:system/etc/init.d/01zipalign \
    vendor/crom/prebuilt/common/etc/init.d/02sysctl:system/etc/init.d/02sysctl \
    vendor/crom/prebuilt/common/etc/init.d/03firstboot:system/etc/init.d/03firstboot \
    vendor/crom/prebuilt/common/etc/init.d/05freemem:system/etc/init.d/05freemem \
    vendor/crom/prebuilt/common/etc/init.d/06removecache:system/etc/init.d/06removecache \
    vendor/crom/prebuilt/common/etc/init.d/07fixperms:system/etc/init.d/07fixperms \
    vendor/crom/prebuilt/common/etc/init.d/09cron:system/etc/init.d/09cron \
    vendor/crom/prebuilt/common/etc/init.d/10sdboost:system/etc/init.d/10sdboost \
    vendor/crom/prebuilt/common/etc/init.d/11battery:system/etc/init.d/11battery \
    vendor/crom/prebuilt/common/etc/init.d/12touch:system/etc/init.d/12touch \
    vendor/crom/prebuilt/common/etc/init.d/13minfree:system/etc/init.d/13minfree \
    vendor/crom/prebuilt/common/etc/init.d/14gpurender:system/etc/init.d/14gpurender \
    vendor/crom/prebuilt/common/etc/init.d/15sleepers:system/etc/init.d/15sleepers \
    vendor/crom/prebuilt/common/etc/init.d/16journalism:system/etc/init.d/16journalism \
    vendor/crom/prebuilt/common/etc/init.d/17sqlite3:system/etc/init.d/17sqlite3 \
    vendor/crom/prebuilt/common/etc/init.d/18wifisleep:system/etc/init.d/18wifisleep \
    vendor/crom/prebuilt/common/etc/init.d/19iostats:system/etc/init.d/19iostats \
    vendor/crom/prebuilt/common/etc/init.d/20setrenice:system/etc/init.d/20setrenice \
    vendor/crom/prebuilt/common/etc/init.d/21tweaks:system/etc/init.d/21tweaks \
    vendor/crom/prebuilt/common/etc/init.d/24speedy_modified:system/etc/init.d/24speedy_modified \
    vendor/crom/prebuilt/common/etc/init.d/25loopy_smoothness_tweak:system/etc/init.d/25loopy_smoothness_tweak \
    vendor/crom/prebuilt/common/etc/init.d/98tweaks:system/etc/init.d/98tweaks \
    vendor/crom/prebuilt/common/etc/helpers.sh:system/etc/helpers.sh \
    vendor/crom/prebuilt/common/etc/init.d.cfg:system/etc/init.d.cfg \
    vendor/crom/prebuilt/common/bin/sysinit:system/bin/sysinit

# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0

# Required packages
PRODUCT_PACKAGES += \
    CellBroadcastReceiver \
    Development \
    SpareParts \
    Superuser \
    su

# Optional packages
PRODUCT_PACKAGES += \
    Basic \
    HoloSpiralWallpaper \
    NoiseField \
    Galaxy4 \
    LiveWallpapersPicker \
    PhaseBeam

# DSPManager
PRODUCT_PACKAGES += \
    DSPManager \
    libcyanogen-dsp \
    audio_effects.conf

# Extra Optional packages
PRODUCT_PACKAGES += \
    Apollo \
    CMFileManager \
    CRoMAbout \
    CRoMOTA \
    LatinIME \
    Launcher3 \
    BluetoothExt \
    DashClock \
    libemoji \
    LockClock \
    OmniSwitch \
    ROMStats

# Extra tools
PRODUCT_PACKAGES += \
    openvpn \
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

# Screen recorder
PRODUCT_PACKAGES += \
    ScreenRecorder \
    libscreenrecorder

# CM Hardware Abstraction Framework
PRODUCT_PACKAGES += \
    org.cyanogenmod.hardware \
    org.cyanogenmod.hardware.xml

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libstagefright_soft_ffmpegadec \
    libstagefright_soft_ffmpegvdec \
    libFFmpegExtractor \
    libnamparser

# easy way to extend to add more packages
-include vendor/extra/product.mk

# Themes
include vendor/crom/config/themes_common.mk

PRODUCT_PACKAGE_OVERLAYS += vendor/crom/overlay/common

# Boot animation include
ifneq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))

# determine the smaller dimension
TARGET_BOOTANIMATION_SIZE := $(shell \
  if [ $(TARGET_SCREEN_WIDTH) -lt $(TARGET_SCREEN_HEIGHT) ]; then \
    echo $(TARGET_SCREEN_WIDTH); \
  else \
    echo $(TARGET_SCREEN_HEIGHT); \
  fi )

# get a sorted list of the sizes
bootanimation_sizes := $(subst .zip,, $(shell ls vendor/crom/prebuilt/common/bootanimation))
bootanimation_sizes := $(shell echo -e $(subst $(space),'\n',$(bootanimation_sizes)) | sort -rn)

# find the appropriate size and set
define check_and_set_bootanimation
$(eval TARGET_BOOTANIMATION_NAME := $(shell \
  if [ -z "$(TARGET_BOOTANIMATION_NAME)" ]; then
    if [ $(1) -le $(TARGET_BOOTANIMATION_SIZE) ]; then \
      echo $(1); \
      exit 0; \
    fi;
  fi;
  echo $(TARGET_BOOTANIMATION_NAME); ))
endef
$(foreach size,$(bootanimation_sizes), $(call check_and_set_bootanimation,$(size)))

PRODUCT_COPY_FILES += \
    vendor/crom/prebuilt/common/bootanimation/$(TARGET_BOOTANIMATION_NAME).zip:system/media/bootanimation.zip
endif

# HFM Files
PRODUCT_COPY_FILES += \
        vendor/crom/prebuilt/etc/hosts.alt:system/etc/hosts.alt \
        vendor/crom/prebuilt/etc/hosts.og:system/etc/hosts.og

# version
RELEASE = false
CROM_VERSION_MAJOR = 7
CROM_VERSION_MINOR = 0


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

