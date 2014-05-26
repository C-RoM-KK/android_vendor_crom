# Inherit common C-RoM stuff
$(call inherit-product, vendor/crom/config/common.mk)

# audio
include frameworks/base/data/sounds/AllAudio.mk

# Optional C-RoM packages
PRODUCT_PACKAGES += \
    HoloSpiralWallpaper \
    MagicSmokeWallpapers \
    NoiseField \
    Galaxy4 \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    PhaseBeam

