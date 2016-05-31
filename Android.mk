LOCAL_PATH := device/patches/samsung/gts2-common

ifeq ($(filter-out gts28wifi gts210wifi,$(TARGET_DEVICE)),)

$(info $(shell ($(LOCAL_PATH)/patch.sh)))

else

$(info $(shell ($(LOCAL_PATH)/revert.sh)))

endif
