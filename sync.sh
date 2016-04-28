#!/bin/bash
LOCAL_PATH=$(dirname $(readlink -f $0))
TOP=${LOCAL_PATH}/../../../..

echo "Checking if patches have been overwritten by updates"

if ! (grep -Fq "THIS FILE HAS BEEN PATCHED" ${TOP}/hardware/samsung/slsi-cm_exynos5433/include/gralloc_priv.h); then

	# If the file doesn't contain the watermark it must have been replaced. We're backing this file up
	# <PATH TO BACKUP DIR> could be ${TOP}/system/vold
	# <FILENAME> could be Utils.cpp
	mv ${TOP}/hardware/samsung/slsi-cm_exynos5433/include/gralloc_priv.h ${TOP}/hardware/samsung/slsi-cm_exynos5433/include/.backup/gralloc_priv.h.backup

	# Replace originals with patched files again
	# <PATH TO PATCHED FILE IN PATCHER> could be ${LOCAL_PATH}/patched/system/vold/Utils.cpp
	# <PATH TO PATCHED DIR> could be ${TOP}/system/vold/
	cp ${LOCAL_PATH}/patched/hardware/samsung/slsi-cm_exynos5433/include/gralloc_priv.h ${TOP}/hardware/samsung/slsi-cm_exynos5433/include/
fi