#!/system/bin/sh
# Copyright (c) 2020, Motorola Mobility LLC, All Rights Reserved.

PATH=/sbin:/system/bin:/system/sbin/:/system/xbin
export PATH

TAG="MMI-MTK-LOG"

LOG_PATHS=("mdlog" "debuglogger" "ramdump")

mkdir_mmi_mtk_log()
{
	if [ -d /data/$1 ];then
		echo "$TAG: $1 already present, skipping.."
	else
		echo "$TAG: Creating log path: /data/$1..."
		case $1 in
			mdlog)
				setprop persist.mmi.enable.mdlog true
				;;
			debuglogger)
				setprop persist.mmi.enable.debuglogger true
				;;
			ramdump)
				setprop persist.mmi.enable.ramdump true
				;;
		esac
	fi
}

# Check if each modem log path is present or has ever been created or not. This is critically required
# given on Android P Meidatek only manages these paths from different modules other than use the init
# mkdir() interface where the filesystem policy will be set. If the relevant path is empty when device
# is moved to Android Q or even still in Android P then we should notify init through the property and
# have it do the mkdir() operation and enforce the file system encryption for security reasons.
for path in ${LOG_PATHS[*]}; do
	mkdir_mmi_mtk_log $path
done
