#!/bin/sh

#checking if there is an hardware_id.conf file 

HARDWARE_ID=`cat /proc/sys/dev/boot/info | grep serial | cut -c 8-21 | awk '{print $1}'`
MODEL_ID=`cat /proc/sys/dev/boot/info | grep model: | awk -F: '{print $2}' | sed -e 's/^[ \t]*//'`
XAGENT_CONF_FILE=/opt/xcloud/etc/xagent.conf
XAGENT_HARDWARE_FILE=/opt/xcloud/etc/hardware_id.conf

echo "HW = ${HARDWARE_ID}"
echo "MODEL_ID = ${MODEL_ID}"

if [ -f $XAGENT_HARDWARE_FILE ]; then
	#checking if hardware id there is the same as 
	OLD_HARDWARE_ID=`cat $XAGENT_HARDWARE_FILE | grep HARDWARE_ID | cut -c 13-`
	echo "NEW_HW = ${OLD_HARDWARE_ID}"

	if [ "$HARDWARE_ID" = "$OLD_HARDWARE_ID" ]; then
		exit 0;
	fi;

	#new HW - need to reregister
	#deleting following values:
	#	x_agent_id=1000-100-356
	#	x_agent_claim_code=KRNXEH
	#	x_agent_registered=1
	sed -e 's/x_agent_id=.*//g' -i $XAGENT_CONF_FILE
	sed -e 's/x_agent_claim_code=.*//g' -i $XAGENT_CONF_FILE
	sed -e 's/x_agent_registered=.*//g' -i $XAGENT_CONF_FILE
	grep -v '^$' $XAGENT_CONF_FILE > /tmp/xagent.conf.new
	mv /tmp/xagent.conf.new $XAGENT_CONF_FILE 
fi;

echo "HARDWARE_ID=$HARDWARE_ID" > $XAGENT_HARDWARE_FILE
echo "MODEL_ID=\"$MODEL_ID\"" >> $XAGENT_HARDWARE_FILE

exit 0

