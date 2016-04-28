#!/bin/bash
LOCAL_PATH=$(dirname $(readlink -f $0))
TOP=$LOCAL_PATH/../../../..

function make_patch_stamp
{
	echo "$1" > $2/.patchlist
	echo "gts2-common" > $2/.patch-device
}

if [ $(cat ${LOCAL_PATH}/PATCHED) = "0" ]; then

	echo 1 > ${LOCAL_PATH}/PATCHED

	make_patch_stamp 'gralloc_priv.h' ${TOP}/hardware/samsung_slsi-cm_exynos5433/include

	if [ ! -d ${TOP}/hardware/samsung_slsi-cm_exynos5433/include/.backup ]; then

		mkdir ${TOP}/hardware/samsung_slsi-cm_exynos5433/include/.backup
		echo "THIS DIR CONTAINS UNTOUCHED/UNPATCHED FILES, DO NOT REMOVE! THIS DIR WILL GET REMOVED AUTOMATICALLY IF NECCESSARY" > ${TOP}/hardware/samsung_slsi-cm_exynos5433/include/.backup/README
		
		mv ${TOP}/hardware/samsung_slsi-cm_exynos5433/include/gralloc_priv.h ${TOP}/hardware/samsung_slsi-cm_exynos5433/include/.backup/gralloc_priv.h.backup
	
	fi

	cp ${LOCAL_PATH}/patched/hardware/samsung_slsi-cm_exynos5433/include/gralloc_priv.h ${TOP}/hardware/samsung_slsi-cm_exynos5433/include/

fi