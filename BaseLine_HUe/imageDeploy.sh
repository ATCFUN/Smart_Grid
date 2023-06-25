#!/bin/sh

# Script used to deploy a target image
# The name of the file containing the image and generated using the targetImageGen command,
# must have a specific syntax:
# - It must start with "baseline_". The characters in this text can be in uppercase or lowercase.
# - It must end with the extension ".tar.gz".
SECONDS=0
usb_fs=/mnt/usb1
bf_fs=/mnt/bf
flash_fs=/mnt/flash
tmp_bf_fs=/tmp/mnt/bf
tmp_flash_fs=/tmp/mnt/flash
working_dir=/var/volatile/tmp/baseLine
bf_gz=bf.tar.gz
flash_gz=flash.tar.gz
kernel_image=uImage-hue.bin
dtb_image=uImage-hue.dtb
uboot_image=u-boot-hue.img
MLO_image=MLO-hue
MLO_dev=/dev/mtd0

export PATH=$PATH:/usr/sbin:/sbin

#check if the variable REMOVE_IMAGE has been exported
rm_image_var=`declare | grep REMOVE_IMAGE`

# Try to find the image file. This file can only be located on the root of
# the flash devices or on the root of the usb device
if [ -d $usb_fs ]; then
    IMAGE_FILE=`find $usb_fs -maxdepth 1 -iname baseline_*.tar.gz -type f`
    DOWNGRADE_FILE=`find $usb_fs -maxdepth 1 -iname *_KFD.tar.gz -type f`
else
    IMAGE_FILE=""
fi
echo "PROGRESS 1"
if [ -z "$IMAGE_FILE" ]; then
    #the variable REMOVE_IMAGE has not been exported
    if [ -z $rm_image_var ]; then
        REMOVE_IMAGE=1
    fi
    IMAGE_FILE=`find $bf_fs -maxdepth 1 -iname baseline_*.tar.gz -type f`
    DOWNGRADE_FILE=`find $bf_fs -maxdepth 1 -iname *_KFD.tar.gz -type f`
else
    #the variable REMOVE_IMAGE has not been exported
    if [ -z $rm_image_var ]; then
        REMOVE_IMAGE=0
    fi
fi
echo "PROGRESS 2"
if [ -z "$IMAGE_FILE" ]; then
    IMAGE_FILE=`find $flash_fs -maxdepth 1 -iname baseline_*.tar.gz -type f`
    DOWNGRADE_FILE=`find $flash_fs -maxdepth 1 -iname *_KFD.tar.gz -type f`
fi
echo "PROGRESS 3"
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

if [ -z "$DOWNGRADE_FILE" ]; then
    DOWNGRADE=0
else
    DOWNGRADE=1
fi

echo "Deploying the target image file $IMAGE_FILE"

#Extract the compressed files
tar -xzvf $IMAGE_FILE -C /  > /dev/null
echo "PROGRESS 8"
# If the image file is not located on the usb device
if [ $REMOVE_IMAGE = 1 ]; then
    #Remove the image file
    rm $IMAGE_FILE
fi
echo "PROGRESS 12"
if [ ! -d $working_dir ]; then
    echo "Auto-deploying the target image file: the directory $working_dir has not been found"
    exit -1
fi
rm -R $bf_fs/webFiles/ #Delete webFiles
echo "PROGRESS 15"
if [ -f $working_dir/$bf_gz ]; then
    tar -xzvf $working_dir/$bf_gz -C /  > /dev/null
fi
echo "PROGRESS 30"
if [ -f $working_dir/$flash_gz ]; then
    if [ -f "/mnt/flash/main_cfg.xml" ]; then
        mv /mnt/flash/main_cfg.xml /mnt/flash/tmp_main_cfg.xml
        tar -xzvf $working_dir/$flash_gz -C / > /dev/null
        mv /mnt/flash/tmp_main_cfg.xml /mnt/flash/main_cfg.xml
    else
        tar -xzvf $working_dir/$flash_gz -C /  > /dev/null
    fi
    #RBAC configuration - apply
    RBACDIRA="/mnt/flash/csbrick/sec_db/rbac/a"
    RBACDIRB="/mnt/flash/csbrick/sec_db/rbac/b"
    RBACFACTORY="/mnt/flash/csbrick/factory_db/rbac/*"

    if [ -z "$(ls -A $RBACDIRA)" ]; then #check only "a" directory, we assume "b" does not exist if "a" doesn't.
        #Empty
        mkdir -p $RBACDIRA
        mkdir -p $RBACDIRB
        cp $RBACFACTORY $RBACDIRA
        cp $RBACFACTORY $RBACDIRB
    fi
fi

echo "PROGRESS 40"
#move or copy the uncompressed folder
cp -R $tmp_bf_fs /mnt/
cp -R $tmp_flash_fs /mnt/

echo "PROGRESS 53"
# Remove the auxiliary files
rm $working_dir/$bf_gz
rm $working_dir/$flash_gz
rmdir $working_dir
echo "PROGRESS 55"

# Try to find the binary file containing the Secondary Bootloader (MLO). This file can only be located on the root of
# the flash devices
MLO_FILE=`find $flash_fs -maxdepth 1 -iname $MLO_image -type f`
if [ -z "$MLO_FILE" ]; then
    MLO_FILE=`find $bf_fs -maxdepth 1 -iname $MLO_image -type f`
fi

# If the MLO file has been found and the downgrade is not forced
if [ -n "$MLO_FILE" ] && [ $DOWNGRADE = 0 ]; then
	# Checks if the development release is currently installed
	MLO_DEVELOP=`grep "U-Boot SPL dev" ${MLO_dev}`

	# Checks if the image is a development release
	MLO_DEVELOP_FILE=`grep "U-Boot SPL dev" ${MLO_FILE}`
    
	# If the development release is currently installed and we try to
    # install the production release 
    if [ -n "$MLO_DEVELOP" ] && [ -z "$MLO_DEVELOP_FILE" ]; then
        DOWNGRADE=1
    # If the production release is currently installed and we try to
    # install the development MLO 
    elif [ -z "$MLO_DEVELOP" ] && [ -n "$MLO_DEVELOP_FILE" ]; then
        DOWNGRADE=1  
	fi
fi

# Try to find the binary file containing the kernel image. This file can only be located on the root of
# the flash devices
KERNEL_FILE=`find $bf_fs -maxdepth 1 -iname $kernel_image -type f`
if [ -z "$KERNEL_FILE" ]; then
    KERNEL_FILE=`find $flash_fs -maxdepth 1 -iname $kernel_image -type f`
fi
echo "PROGRESS 60"
# If the image file has been found
# If the image file has been found
flash_dev=/dev/mtd8

if [ -n "$KERNEL_FILE" ]; then
    valDate=`hexdump -n4 -s8 -e '1/4 "0x%08x"' $KERNEL_FILE`
    # Convert from big endian to little endian
    dateNew=$(( (valDate<<8 & 0xff00ff00) | (valDate>>8 & 0xff00ff) ))
    dateNew=$(( (dateNew<<16 & 0xffff0000) | dateNew>>16 ))

    valDate=`hexdump -n4 -s8 -e '1/4 "0x%08x"' $flash_dev`
    # Convert from big endian to little endian
    dateCurrent=$(( (valDate<<8 & 0xff00ff00) | (valDate>>8 & 0xff00ff) ))
    dateCurrent=$(( (dateCurrent<<16 & 0xffff0000) | dateCurrent>>16 ))

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
echo "PROGRESS 90"
# If the dtb file has been found
if [ -n "$DTB_FILE" ]; then
    # echo "Flashing the dtb file $DTB_FILE"
    echo ""
    yes | update_dtb $DTB_FILE  > /dev/null
    echo "PROGRESS 95"
    sleep 1
    rm $DTB_FILE
fi

# If the MLO file has been found
if [ -n "$MLO_FILE" ]; then
    MLO_date $MLO_FILE
    RESULT=$?
    # The current MLO image is older than $MLO_file
    if [ $RESULT = 1 ]; then
        echo ""
        yes | update_MLO $MLO_FILE
    # The current MLO image is newer than $MLO_file
    elif [ $RESULT = 2 ]; then
		# Only flash the image if it has been forced; "_KFD.tar.gz"
        if [ $DOWNGRADE = 1 ]; then
            echo ""
            yes | update_MLO $MLO_FILE
        fi
    fi
	#we don't need this any more
    rm $MLO_FILE
    sleep 1
fi

echo "PROGRESS 96"
# Try to find the binary file containing the u-boot. This file can only be located on the root of
# the flash devices
UBOOT_FILE=`find $flash_fs -maxdepth 1 -iname $uboot_image -type f`
if [ -z "$UBOOT_FILE" ]; then
    UBOOT_FILE=`find $bf_fs -maxdepth 1 -iname $uboot_image -type f`
fi

# If the u-boot file has been found
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
    sleep 1
fi

echo "PROGRESS 98"
#FS permissions
setfacl -bn $flash_fs
setfacl -bn -R $flash_fs
setfacl -d -m u::rw,g::rw,o::rw $flash_fs
setfacl -R -m u::rwx,g::rw,o::rw $flash_fs
setfacl -bn $flash_fs/cfgFiles
setfacl -bn -R $flash_fs/cfgFiles
setfacl -d -m u::rw,g::rw,o::rw $flash_fs/cfgFiles
setfacl -R -m u::rw,g::rw,o::rw $flash_fs/cfgFiles
setfacl -bn $bf_fs
setfacl -bn -R $bf_fs
setfacl -d -m u::rw,g::rw,o::rw $bf_fs
setfacl -R -m u::rwx,g::rw,o::rw $bf_fs
setfacl -bn -R $bf_fs/ssh
setfacl -d -m u::rw,g::-,o::- $bf_fs/ssh
setfacl -m u::rw,g::-,o::- $bf_fs/ssh
setfacl -m u::rw,g::-,o::- $bf_fs/ssh/*
if [ -d $bf_fs/rootfs/ ]; then
    rm -R $bf_fs/rootfs/
fi
echo -e "\nThe target image file $IMAGE_FILE has been deployed"
echo TIME TAKEN: ${SECONDS} seconds
echo TIME TAKEN: ${SECONDS} seconds > /tmp/DEPLOYTIME.txt
sleep 2
echo "PROGRESS 100"
sleep 3
if [ $REMOVE_IMAGE = 1 ]; then
    echo "Rebooting the system"
    #rm /run/BLApp.pid
    reboot
else
    umount $usb_fs
    read -p "Remove USB and press Enter to restart..."
    reboot
fi
exit 0
