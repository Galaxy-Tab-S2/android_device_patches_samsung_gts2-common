#!/bin/bash
LOCAL_PATH=$(dirname $(readlink -f $0))
TOP=$LOCAL_PATH/../../../..

if [ $(cat ${LOCAL_PATH}/PATCHED) = "1" ]; then
    
    echo "NOT BUILDING gts2-common! REVERTING gts2-common PATCHES!"

	echo 0 > ${LOCAL_PATH}/PATCHED
   
   if [ -f ${TOP}/hardware/samsung_slsi-cm/exynos5433/include/.patchlist ]; then

   		if (grep -Fq "gralloc_priv.h" ${TOP}/hardware/samsung_slsi-cm/exynos5433/include/.patchlist); then

   			if [ $(cat ${TOP}/hardware/samsung_slsi-cm/exynos5433/include/.patch-device) = "gts2-common" ]; then
   			
				mv ${TOP}/hardware/samsung_slsi-cm/exynos5433/include/.backup/gralloc_priv.h.backup ${TOP}/hardware/samsung_slsi-cm/exynos5433/include/gralloc_priv.h
			
				rm -R ${TOP}/hardware/samsung_slsi-cm/exynos5433/include/.backup
				rm ${TOP}/hardware/samsung_slsi-cm/exynos5433/include/.patchlist
				rm ${TOP}/hardware/samsung_slsi-cm/exynos5433/include/.patch-device
			fi
		
		else

			# If there aren't any simillarities we're restoring un-patched files.
			mv ${TOP}/hardware/samsung_slsi-cm/exynos5433/include/.backup/gralloc_priv.h.backup ${TOP}/hardware/samsung_slsi-cm/exynos5433/include/gralloc_priv.h

			if [ ! "$(ls -A ${TOP}/hardware/samsung_slsi-cm/exynos5433/include/.backup)" ]; then
				rm -R ${TOP}/hardware/samsung_slsi-cm/exynos5433/include/.backup
			fi

		fi
		
	fi
fi
