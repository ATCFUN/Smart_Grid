#!/bin/sh

SYS_APP_PATH="/usr/sbin"
AUTOLOAD_PATH="/mnt/flash"
BF_PATH_SSH_KEYS="/mnt/bf/ssh"
ROOTFS_PATH_SSH_KEYS="/etc/ssh"
CMD_LINE="/proc/cmdline"
BL_RELEASE=/var/run/BLrelease

# This is a development release
touch /tmp/development
chmod 0444 /tmp/development

# In is release the hardening is not implemented
touch /tmp/hardenOff
chmod 0444 /tmp/hardenOff  

# copy SSH keys if necessary
if [ ! -d ${BF_PATH_SSH_KEYS} ]; then
    mkdir ${BF_PATH_SSH_KEYS}
	chmod 777 ${BF_PATH_SSH_KEYS}
fi
if [ ! -f ${BF_PATH_SSH_KEYS}/ssh_host_rsa_key ]; then
	cp ${ROOTFS_PATH_SSH_KEYS}/ssh_host_rsa_key ${BF_PATH_SSH_KEYS} 2>/dev/null
fi
if [ ! -f ${BF_PATH_SSH_KEYS}/ssh_host_rsa_key.pub ]; then
	cp ${ROOTFS_PATH_SSH_KEYS}/ssh_host_rsa_key.pub ${BF_PATH_SSH_KEYS} 2>/dev/null
fi

if [ ! -f ${BF_PATH_SSH_KEYS}/ssh_host_ecdsa_key ]; then
	cp ${ROOTFS_PATH_SSH_KEYS}/ssh_host_ecdsa_key ${BF_PATH_SSH_KEYS} 2>/dev/null
fi
if [ ! -f ${BF_PATH_SSH_KEYS}/ssh_host_ecdsa_key.pub ]; then
	cp ${ROOTFS_PATH_SSH_KEYS}/ssh_host_ecdsa_key.pub ${BF_PATH_SSH_KEYS} 2>/dev/null
fi

if [ ! -f ${BF_PATH_SSH_KEYS}/ssh_host_dsa_key ]; then
	cp ${ROOTFS_PATH_SSH_KEYS}/ssh_host_dsa_key ${BF_PATH_SSH_KEYS} 2>/dev/null
fi
if [ ! -f ${BF_PATH_SSH_KEYS}/ssh_host_dsa_key.pub ]; then
	cp ${ROOTFS_PATH_SSH_KEYS}/ssh_host_dsa_key.pub ${BF_PATH_SSH_KEYS} 2>/dev/null
fi

if [ ! -f ${BF_PATH_SSH_KEYS}/ssh_host_ed25519_key ]; then
	cp ${ROOTFS_PATH_SSH_KEYS}/ssh_host_ed25519_key ${BF_PATH_SSH_KEYS} 2>/dev/null
fi
if [ ! -f ${BF_PATH_SSH_KEYS}/ssh_host_ed25519_key.pub ]; then
	cp ${ROOTFS_PATH_SSH_KEYS}/ssh_host_ed25519_key.pub ${BF_PATH_SSH_KEYS} 2>/dev/null
fi

# Get the kernel bootargs 
BOOTARGS=`cat $CMD_LINE`

# Try to find the next substring
CONSOLE_BAUD="ttyS0,19200"

# grep -q Quiet. Return 0 if PATTERN is found, 1 otherwise
if echo "$BOOTARGS" | grep -q "$CONSOLE_BAUD"; then
#  echo "ttyS0,19200 found";
  cp /etc/tty19200_inittab /etc/inittab
# tell init process to parse inittab again
  telinit Q
fi

#The flash file system has already been mounted, we can start the cron utility
crond -l 9 -c /etc/cron.d

# Set up the loader enviroment
ldconfig

# Disable GRO (Generic Receive Offload) for ethernet devices
ethtool -K eth1 gro off
ethtool -K eth0 gro off
ethtool -K eth2 gro off
ethtool -K eth3 gro off

# Start the applications environment
if [ -x ${SYS_APP_PATH}/sysAppInit_e500V2 ]; then
    ${SYS_APP_PATH}/sysAppInit_e500V2
elif [ -x ${AUTOLOAD_PATH}/sysAppInit_e500V2 ]; then
    ${AUTOLOAD_PATH}/sysAppInit_e500V2
else
    echo "sysAppInit application not found"
fi

if [ -f $BL_RELEASE ]; then
    IMAGE_FILE=`cat $BL_RELEASE`
    sysLog_e500V2 ERROR "The $IMAGE_FILE file has not been deployed, data integrity failure"
    rm $BL_RELEASE 
fi

exit 0
