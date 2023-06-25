#!/bin/sh

# Script used to deploy a target image
# The name of the file containing the image and generated using the targetImageGen command, 
# must have a specific syntax: 
# - It must start with "baseline_". The characters in this text can be in uppercase or lowercase.
# - It must end with the extension ".tar.gz".

usb_fs=/mnt/usb1
bf_fs=/mnt/bf
flash_fs=/mnt/flash
flash_dev=/dev/mtd1
nflash_fs=/mnt/nflash
working_dir=/var/volatile/tmp/baseLine
bf_gz=bf.tar.gz
flash_gz=flash.tar.gz
nflash_gz=nflash.tar.gz
kernel_image=uImage-sm_cpu_dct.bin
dtb_image=uImage-sm_cpu_dct.dtb
uboot_image=u-boot.bin
BL_RELEASE=/var/run/BLrelease

# Try to find the image file. This file can only be located on the root of 
# the flash devices or on the root of the usb device
if [ -d $usb_fs ]; then
    IMAGE_FILE=`find $usb_fs -maxdepth 1 -iname baseline_*.tar.gz -type f`
    DOWNGRADE_FILE=`find $usb_fs -maxdepth 1 -iname *_KFD.tar.gz -type f`
else
    IMAGE_FILE=""
fi

if [ -z "$IMAGE_FILE" ]; then
    REMOVE_IMAGE=1
    IMAGE_FILE=`find $bf_fs -maxdepth 1 -iname baseline_*.tar.gz -type f`
	DOWNGRADE_FILE=`find $bf_fs -maxdepth 1 -iname *_KFD.tar.gz -type f`
else
    REMOVE_IMAGE=0    
fi

if [ -z "$IMAGE_FILE" ]; then
    IMAGE_FILE=`find $flash_fs -maxdepth 1 -iname baseline_*.tar.gz -type f`
	DOWNGRADE_FILE=`find $flash_fs -maxdepth 1 -iname *_KFD.tar.gz -type f`
fi

if [ -z "$IMAGE_FILE" ]; then
	if [ -d $nflash_fs ]; then
    	IMAGE_FILE=`find $nflash_fs -maxdepth 1 -iname baseline_*.tar.gz -type f`
		DOWNGRADE_FILE=`find $nflash_fs -maxdepth 1 -iname *_KFD.tar.gz -type f`
	fi
fi
if [ -z "$IMAGE_FILE" ]; then
    IMAGE_FILE=`find /media/ram/firmware -maxdepth 1 -iname baseline_*.tar.gz -type f`
	DOWNGRADE_FILE=`find /media/ram/firmware -maxdepth 1 -iname *_KFD.tar.gz -type f`
fi

if [ -z "$IMAGE_FILE" ]; then
    IMAGE_FILE=`find /var/volatile/firmware -maxdepth 1 -iname baseline_*.tar.gz -type f`
    DOWNGRADE_FILE=`find /var/volatile/firmware -maxdepth 1 -iname *_KFD.tar.gz -type f`
fi

# If the image file has not been found
if [ -z "$IMAGE_FILE" ]; then
    exit -1
fi

# Check the data integrity of the file
gzip -t $IMAGE_FILE
if [ $? != 0 ]; then
    echo "The file $IMAGE_FILE seems to be corrupted"

	# check if the sysLog is running
    SYSLOG=$(pidof sysAppInit_e500V2)

    if [ ! "$SYSLOG" ];then
        #sysLog is not running
        # Mark the Baseline file has not been deployed 
        echo $IMAGE_FILE > $BL_RELEASE
    else    
        # sysLog is running"
        sysLog_e500V2 ERROR "The $IMAGE_FILE file has not been deployed, data integrity failure"
    fi

	# If the image file is not located on the usb device
	if [ $REMOVE_IMAGE = 1 ]; then
		#Remove the image file
		rm $IMAGE_FILE
	fi

	exit -1
fi

# If the file with the baseline release contains the string "_KFD.tar.gz" (Kernel Force Downgrage)
if [ -z "$DOWNGRADE_FILE" ]; then
    DOWNGRADE=0
else
    DOWNGRADE=1
fi

#Find for installation script within the image file
echo "Finding custom installation script within $IMAGE_FILE"
INSTALL_FILE="imageDeploy.sh"
tar ztvf $IMAGE_FILE | grep $INSTALL_FILE && tar zxvf $IMAGE_FILE $INSTALL_FILE
if [ -f $INSTALL_FILE ]; then
    eval ./$INSTALL_FILE
# If the image file has been deployed using a usb device, then the system has not been
# rebooted.
if [ $REMOVE_IMAGE = 0 ]; then
    while true
    do
        echo
        echo
        echo
        echo
        echo "**************************************************************************"
        echo
        echo "Please, remove the USB device and then press any key to reboot the system."
        echo
        echo "**************************************************************************"
        read -n 1 var_any
        echo
        echo
        if [ -d $usb_fs ]; then
            echo "The USB device has not been removed!"
        else
            echo "      Rebooting the system!"
            echo
            echo
            sleep 2
            reboot
        fi
    done
fi
    echo "PROGRESS 100"
    exit 0 #The installation script should reboot the system
fi
#At this point, we are downgrading to a release without cybersecurity. If tar.gz does not contain uImage, then we cannot perform a downgrade
FLASH_TAR="var/volatile/tmp/baseLine/flash.tar.gz"
tar -zxvf $IMAGE_FILE $FLASH_TAR -C .
UIMAGE_FILE="mnt/flash/$kernel_image"
FOUND=$(tar ztvf $FLASH_TAR | grep $UIMAGE_FILE)
rm -R $FLASH_TAR

if [ "$FOUND" == "" ]; then
	BF_TAR="var/volatile/tmp/baseLine/bf.tar.gz"
	tar -zxvf $IMAGE_FILE $BF_TAR -C .
	UIMAGE_FILE="mnt/bf/$kernel_image"
	FOUND=$(tar ztvf $BF_TAR | grep $UIMAGE_FILE)
	rm -R $BF_TAR
fi

if [ "$FOUND" == "" ]; then
	NFLASH_TAR="var/volatile/tmp/baseLine/nflash.tar.gz"
	tar -zxvf $IMAGE_FILE $NFLASH_TAR -C .
	UIMAGE_FILE="mnt/nflash/$kernel_image"
	FOUND=$(tar ztvf $NFLASH_TAR | grep $UIMAGE_FILE)
	rm -R $NFLASH_TAR
fi

if [ "$FOUND" == "" ]; then
    echo "ERROR must include kernel image"
    exit -1
fi

echo "$FOUND"

echo "Restoring file system permissons"
echo "PROGRESS 1"
#At this point, we are installing a release without CSApp nor webApp
#First, restore default ACLs
setfacl -bn $flash_fs
setfacl -bn -R $flash_fs
setfacl -d -m u::rwx,g::rwx,o::rwx $flash_fs
setfacl -R -m u::rwx,g::rwx,o::rwx $flash_fs
setfacl -bn $flash_fs/cfgFiles
setfacl -bn -R $flash_fs/cfgFiles
setfacl -d -m u::rwx,g::rwx,o::rwx $flash_fs/cfgFiles
setfacl -R -m u::rwx,g::rwx,o::rwx $flash_fs/cfgFiles
setfacl -bn $bf_fs
setfacl -bn -R $bf_fs
setfacl -d -m u::rwx,g::rwx,o::rwx $bf_fs
setfacl -R -m u::rwx,g::rwx,o::rwx $bf_fs
setfacl -bn -R $bf_fs/ssh
setfacl -d -m u::rw,g::-,o::- $bf_fs/ssh
setfacl -m u::rw,g::-,o::- $bf_fs/ssh
setfacl -m u::rw,g::-,o::- $bf_fs/ssh/*
if [ -d $nflash_fs ]; then
	setfacl -bn $nflash_fs
	setfacl -bn -R $nflash_fs
	setfacl -d -m u::rwx,g::rwx,o::rwx $nflash_fs
fi

echo "PROGRESS 10"
echo "Removing trash"
rm $flash_fs/CSApp
rm $flash_fs/soeBinC2_e500V2.so
rm $flash_fs/soeBinC_e500V2.so
rm $flash_fs/ewServer_e500V2
rm $flash_fs/t300ApplyConfArchive_e500V2
rm $flash_fs/t300ExportConfArchive_e500V2
rm $flash_fs/t300ApplyStoredConf_e500V2
rm $flash_fs/lib/libCSApi_e500V2.so
rm $flash_fs/lib/libewT300_e500V2.so
rm $flash_fs/sbin/firmware-upgrade-version.sh
rm $flash_fs/sbin/imageDeploy.sh
rm $flash_fs/sbin/version-inactive.sh
rm $flash_fs/sbin/version.sh
rm $flash_fs/sbin/csLauncher
rm $flash_fs/sbin/applyPamConf
rm $flash_fs/sbin/aclForUserLogin
rm -R $flash_fs/webApp/
rm -R $flash_fs/csbrick/
rm -R $bf_fs/pam/
rm -R $bf_fs/webFiles/
if [ -d $bf_fs/rootfs/ ]; then
    rm -R $bf_fs/rootfs/
fi
echo "PROGRESS 15"
echo "Deploying the target image file $IMAGE_FILE"

#Extract the compressed files
tar -xzvf $IMAGE_FILE -C /
echo "PROGRESS 20"
# If the image file is not located on the usb device
if [ $REMOVE_IMAGE = 1 ]; then
    #Remove the image file
    rm $IMAGE_FILE
fi

if [ ! -d $working_dir ]; then
    echo "Auto-deploying the target image file: the directory $working_dir has not been found"
    exit -1 
fi

if [ -f $working_dir/$bf_gz ]; then
    tar -xzvf $working_dir/$bf_gz --exclude='mnt/bf/log/*' -C /
fi
echo "PROGRESS 25"
if [ -f $working_dir/$flash_gz ]; then
    tar -xzvf $working_dir/$flash_gz --exclude='mnt/flash/log/*' -C /
fi
echo "PROGRESS 30"
if [ -f $working_dir/$nflash_gz ]; then
	if [ -d $nflash_fs ]; then
    	tar -xzvf $working_dir/$nflash_gz --exclude='mnt/nflash/log/*' -C /
	fi
fi
echo "PROGRESS 40"
# Remove the auxiliary files
rm -R $working_dir
echo "PROGRESS 50"
# Try to find the binary file containing the kernel image. This file can only be located on the root of 
# the flash devices
KERNEL_FILE=`find $bf_fs -maxdepth 1 -iname $kernel_image -type f`
if [ -z "$KERNEL_FILE" ]; then
    KERNEL_FILE=`find $flash_fs -maxdepth 1 -iname $kernel_image -type f`
fi

if [ -z "$KERNEL_FILE" ]; then
	if [ -d $nflash_fs ]; then
    	KERNEL_FILE=`find $nflash_fs -maxdepth 1 -iname $kernel_image -type f`
	fi
fi
echo "PROGRESS 60"
# If the image file has been found
if [ -n "$KERNEL_FILE" ]; then

    dateNew=`hexdump -n4 -s8 -e '1/4 "%08x"' $KERNEL_FILE`
    dateCurrent=`hexdump -n4 -s8 -e '1/4 "%08x"' $flash_dev`

    diff="$(( 16#$dateNew - 16#$dateCurrent ))"
    echo "Difference $diff"

	# The current kernel image is older than $KERNEL_FILE
    if [ "$diff" -gt 0 ]; then
        echo ""
        yes | update_kernel $KERNEL_FILE
	# The current kernel image is newer than $KERNEL_FILE
    elif [ "$diff" -lt 0 ]; then
		# Only flash the image if it has been forced; "_KFD.tar.gz"
        if [ $DOWNGRADE = 1 ]; then
            echo ""
            yes | update_kernel $KERNEL_FILE
        fi
    fi
    # echo "Flashing the kernel image $KERNEL_FILE"
    echo "PROGRESS 70"
	 #we don't need this any more
    rm $KERNEL_FILE
fi

# Try to find the binary file containing Device Tree Blob (DTB). This file can only be located on the root of 
# the flash devices
DTB_FILE=`find $bf_fs -maxdepth 1 -iname $dtb_image -type f`
if [ -z "$DTB_FILE" ]; then
    DTB_FILE=`find $flash_fs -maxdepth 1 -iname $dtb_image -type f`
fi

if [ -z "$DTB_FILE" ]; then
	if [ -d $nflash_fs ]; then
    	DTB_FILE=`find $nflash_fs -maxdepth 1 -iname $dtb_image -type f`
	fi
fi
echo "PROGRESS 75"
# If the dtb file has been found
if [ -n "$DTB_FILE" ]; then
    # echo "Flashing the dtb file $DTB_FILE"
    echo ""
    yes | update_dtb $DTB_FILE
    sleep 1
	rm $DTB_FILE
fi

# Try to find the binary file containing the u-boot image. This file can only be located on the root of 
# the flash devices
UBOOT_FILE=`find $bf_fs -maxdepth 1 -iname $uboot_image -type f`
if [ -z "$UBOOT_FILE" ]; then
    UBOOT_FILE=`find $flash_fs -maxdepth 1 -iname $uboot_image -type f`
fi

if [ -z "$UBOOT_FILE" ]; then
	if [ -d $nflash_fs ]; then
    	UBOOT_FILE=`find $nflash_fs -maxdepth 1 -iname $uboot_image -type f`
	fi
fi
echo "PROGRESS 80"
# If the image file has been found
if [ -n "$UBOOT_FILE" ]; then
    uboot_date $UBOOT_FILE
    RESULT=$?
    # The current u-boot image is older than $uboot_file
    if [ $RESULT = 1 ]; then
        echo ""
        yes | update_uboot $UBOOT_FILE
    # The current u-boot image is newer than $uboot_file
    elif [ $RESULT = 2 ]; then
		# Only flash the image if it has been forced; "_KFD.tar.gz"
        if [ $DOWNGRADE = 1 ]; then
            echo ""
            yes | update_uboot $UBOOT_FILE
        fi
    fi
	#we don't need this any more
    rm $UBOOT_FILE
fi

echo "PROGRESS 90"
echo -e "\nThe target image file $IMAGE_FILE has been deployed"

if [ $REMOVE_IMAGE = 1 ]; then
    echo "Rebooting the system"
    echo "PROGRESS 100"
    reboot
else
    echo "PROGRESS 100"
    while true
    do
        echo
        echo
        echo
        echo
        echo "**************************************************************************"
        echo
        echo "Please, remove the USB device and then press any key to reboot the system."
        echo
        echo "**************************************************************************"
        read -n 1 var_any
        echo
        echo
        if [ -d $usb_fs ]; then
            echo "The USB device has not been removed!"
        else
            echo "      Rebooting the system!"
            echo
            echo
            sleep 2
            reboot
        fi
    done
fi

exit 0
