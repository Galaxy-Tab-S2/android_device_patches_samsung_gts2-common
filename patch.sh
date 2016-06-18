#!/bin/bash
LOCAL_PATH=$(dirname $(readlink -f $0))
TOP=$LOCAL_PATH/../../../..

function make_patch_stamp
{
	echo "$1" > $2/.patchlist
	echo "gts2-common" > $2/.patch-device
}

if [ $(cat ${LOCAL_PATH}/PATCHED) = "0" ]; then

	echo "Applying gts2-common patches"

	echo 1 > ${LOCAL_PATH}/PATCHED

	# Copy gts28wifi defconfig into kernel
	cp ${LOCAL_PATH}/patched/kernel/samsung/gts2/arch/arm/configs/cm_exynos5433-gts28wifi_defconfig ${TOP}/kernel/samsung/gts2/arch/arm/configs/cm_exynos5433-gts28wifi_defconfig

	# Disable SELINUX
	make_patch_stamp 'init.cpp' ${TOP}/system/core/init/

	if [ ! -d ${TOP}/hardware/samsung_slsi-cm/exynos5433/include/.backup ]; then

		mkdir ${TOP}/system/core/init/.backup
		echo "THIS DIR CONTAINS UNTOUCHED/UNPATCHED FILES, DO NOT REMOVE! THIS DIR WILL GET REMOVED AUTOMATICALLY IF NECCESSARY" > ${TOP}/system/core/init/.backup/README

		mv ${TOP}/system/core/init/init.cpp ${TOP}/system/core/init/.backup/init.cpp.backup

	fi

	cp ${LOCAL_PATH}/patched/system/core/init/init.cpp ${TOP}/system/core/init

fi
