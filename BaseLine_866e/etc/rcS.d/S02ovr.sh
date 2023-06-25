#!/bin/sh

PATH_OVERRIDE="/etc/ovr"
SYS_UPDATE_PATH="/usr/sbin"
SYS_INITD_PATH="/etc/init.d"

# if there are some files that must be overriden
if [ -d ${PATH_OVERRIDE} ]; then
    echo "copying ${PATH_OVERRIDE}/ on /"    
    cp -a ${PATH_OVERRIDE}/. / 2>/dev/null
fi

chmod -R ugo+rwx /mnt

chmod -R ugo+rwx /usr/sbin

chmod -R u+rwx ${SYS_INITD_PATH}

chmod -R u+rwx /etc/rcS.d

chmod -R ugo+rx /lib

chmod 755 ${SYS_INITD_PATH}/baselineInit.sh

chmod 755 ${SYS_INITD_PATH}/xAutoLoad.sh

# Do not start the vsftpd daemon
rm `find /etc -name S80vsftpd`

# To make vsftpd happy
mkdir -p /var/share/empty
chmod go-w /var/share/empty 

# To make sshd happy
mkdir -p /var/log
touch /var/log/lastlog
chmod 664 /var/log/lastlog

mkdir /mnt/flash
chmod ugo+rwx /mnt/flash

mkdir /mnt/bf
chmod ugo+rwx /mnt/bf

# mkdir /mnt/nflash
# chmod ugo+rwx /mnt/nflash

rm /mnt/card

rm /mnt/cf

rm /mnt/net

rm /mnt/ram

# The next commands must be a link to /bin/busybox.suid
ln -sf /bin/busybox.suid /bin/login
ln -sf /bin/busybox.suid /bin/ping
ln -sf /bin/busybox.suid /bin/ping6
ln -sf /bin/busybox.suid /bin/su
ln -sf /bin/busybox.suid /usr/bin/crontab
ln -sf /bin/busybox.suid /usr/bin/passwd
ln -sf /bin/busybox.suid /usr/bin/traceroute
ln -sf /bin/busybox.suid /usr/bin/traceroute6
ln -sf /bin/busybox.suid /usr/bin/vlock

# The next commands must use busybox instead of tinylogin
ln -sf /bin/busybox /bin/adduser
ln -sf /bin/busybox /bin/addgroup
ln -sf /bin/busybox /bin/deluser
ln -sf /bin/busybox /bin/delgroup 

if [ -x ${SYS_UPDATE_PATH}/update-rc.d ]; then
#   ${SYS_UPDATE_PATH}/update-rc.d inetd.busybox defaults
	if [ -x ${SYS_INITD_PATH}/baselineInit.sh ]; then
		${SYS_UPDATE_PATH}/update-rc.d baselineInit.sh start 99 2 3 4 5 . > /dev/null 2>&1
	fi
	if [ -x ${SYS_INITD_PATH}/xAutoLoad.sh ]; then
		${SYS_UPDATE_PATH}/update-rc.d xAutoLoad.sh start 99 2 3 4 5 . > /dev/null 2>&1
	fi
	if [ -x ${SYS_INITD_PATH}/snmpd ]; then
		${SYS_UPDATE_PATH}/update-rc.d -f snmpd remove > /dev/null 2>&1
		${SYS_UPDATE_PATH}/update-rc.d snmpd stop 20 0 1 6 . > /dev/null 2>&1
	fi
fi
