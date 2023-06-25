#!/bin/sh

FLASH_PATH_OVERRIDE="/mnt/flash/rootfs"
BF_PATH_OVERRIDE="/mnt/bf/rootfs"
BF_PATH_SSH_KEYS="/mnt/bf/ssh"
ROOTFS_PATH_SSH_KEYS="/etc/ssh"

chmod 777 /mnt/bf
chmod 777 /mnt/flash
# chmod 777 /mnt/nflash

if [ ! -d /mnt/flash/lib ]; then
    mkdir /mnt/flash/lib
fi

chmod 777 /mnt/flash/lib

if [ ! -d /mnt/flash/sbin ]; then
    mkdir /mnt/flash/sbin
fi

chmod 777 /mnt/flash/sbin

if [ ! -d /mnt/bf/log ]; then
    mkdir /mnt/bf/log
fi

chmod 755 /mnt/bf/log

# copy the SSH keys
if [ -d ${BF_PATH_SSH_KEYS} ]; then
    echo "copying ${BF_PATH_SSH_KEYS}/ on ${ROOTFS_PATH_SSH_KEYS}"    
    cp -a ${BF_PATH_SSH_KEYS}/. ${ROOTFS_PATH_SSH_KEYS} 2>/dev/null
fi

chmod 0600 ${ROOTFS_PATH_SSH_KEYS}/ssh_host_rsa_key ${BF_PATH_SSH_KEYS} 2>/dev/null
chmod 0600 ${ROOTFS_PATH_SSH_KEYS}/ssh_host_rsa_key.pub ${BF_PATH_SSH_KEYS} 2>/dev/null
chmod 0600 ${ROOTFS_PATH_SSH_KEYS}/ssh_host_ecdsa_key ${BF_PATH_SSH_KEYS} 2>/dev/null
chmod 0600 ${ROOTFS_PATH_SSH_KEYS}/ssh_host_ecdsa_key.pub ${BF_PATH_SSH_KEYS} 2>/dev/null
chmod 0600 ${ROOTFS_PATH_SSH_KEYS}/ssh_host_dsa_key ${BF_PATH_SSH_KEYS} 2>/dev/null
chmod 0600 ${ROOTFS_PATH_SSH_KEYS}/ssh_host_dsa_key.pub ${BF_PATH_SSH_KEYS} 2>/dev/null
chmod 0600 ${ROOTFS_PATH_SSH_KEYS}/ssh_host_ed25519_key ${BF_PATH_SSH_KEYS} 2>/dev/null
chmod 0600 ${ROOTFS_PATH_SSH_KEYS}/ssh_host_ed25519_key.pub ${BF_PATH_SSH_KEYS} 2>/dev/null

# if there are some files that must be overriden
if [ -d ${BF_PATH_OVERRIDE} ]; then
    echo "copying ${BF_PATH_OVERRIDE}/ on /"    
    cp -a ${BF_PATH_OVERRIDE}/. / 2>/dev/null
elif [ -d ${FLASH_PATH_OVERRIDE} ]; then
    echo "copying ${FLASH_PATH_OVERRIDE}/ on /"    
    cp -a ${FLASH_PATH_OVERRIDE}/. / 2>/dev/null
fi

