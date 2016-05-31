#!/bin/bash
LOCAL_PATH=$(dirname $(readlink -f $0))
TOP=$LOCAL_PATH/../../../..

if [ $(cat ${LOCAL_PATH}/PATCHED) = "0" ]; then

	echo "Applying gts2-common patches"

	echo 1 > ${LOCAL_PATH}/PATCHED

	# Copy gts28wifi defconfig into kernel
	cp ${LOCAL_PATH}/patched/kernel/samsung/gts2/arch/arm/configs/cm_exynos5433-gts28wifi_defconfig ${TOP}/kernel/samsung/gts2/arch/arm/configs/cm_exynos5433-gts28wifi_defconfig

fi
