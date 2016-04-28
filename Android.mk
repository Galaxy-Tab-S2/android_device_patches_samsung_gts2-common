LOCAL_PATH := device/patches/samsung/gts2-common

ifeq ($(TARGET_SOC), exynos5433)
ifeq ($(TARGET_COMMON_DEVICE), gts2-common)

$(info $(shell ($(LOCAL_PATH)/patch.sh)))
$(info $(shell ($(LOCAL_PATH)/sync.sh)))

else

$(info $(shell ($(LOCAL_PATH)/revert.sh)))

endif
endif