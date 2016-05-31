#!/bin/bash
LOCAL_PATH=$(dirname $(readlink -f $0))
TOP=$LOCAL_PATH/../../../..

if [ $(cat ${LOCAL_PATH}/PATCHED) = "1" ]; then
    
    echo "NOT BUILDING gts2-common! REVERTING gts2-common PATCHES!"

	echo 0 > ${LOCAL_PATH}/PATCHED

	# This isn't neccessary but we'll do it anyways just to clear things up
	rm ${TOP}/kernel/samsung/gts2/arch/arm/configs/cm_exynos5433-gts28wifi_defconfig
   
fi
