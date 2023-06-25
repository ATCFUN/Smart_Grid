#!/bin/sh
#
# Project Lorax USB-B Finished Goods Functional Test Script
#
# Put /lib/genohm-scada
#
# Parses the udhcpd config file for start and finish addresses
# Pings all the IPs in the udhcpd config file range, in parallel
# Detects the first responder
# Pings it with a few big pings, a couple of times if necessary
# Returns OK if all the big pings are successfully received
#


#udhcp config file
FILE=/etc/udhcpd.conf

if [ ! -f $FILE ]; then
  echo "ERROR - Could not find config file: $FILE"
  exit 131
fi

STARTPARAM=`cat $FILE 2>/dev/null | egrep ^start | awk '{ print $2 }'`
IPBASE=`echo $STARTPARAM | cut -d. -f1-3`
STARTSUFFIX=`echo $STARTPARAM | cut -d. -f4`

if [ "$IPBASE"x == x -o "$STARTSUFFIX"x == x ]; then
  echo "ERROR - Could not parse start ip from config file: $FILE"
  #echo "IPBASE=$IPBASE   STARTSUFFIX=$STARTSUFFIX"
  exit 132
fi

expr $STARTSUFFIX \>= 1 >/dev/null 2>&1 && expr $STARTSUFFIX \<= 255 >/dev/null 2>&1 || { \
  echo "ERROR - Start ip suffix is out of range: $STARTSUFFIX"
  exit 133
}

#echo "IPBASE=$IPBASE   STARTSUFFIX=$STARTSUFFIX"

ENDPARAM=`cat $FILE 2>/dev/null | egrep ^end | awk '{ print $2 }'`
IPBASE2=`echo $ENDPARAM | cut -d. -f1-3`
ENDSUFFIX=`echo $ENDPARAM | cut -d. -f4`

if [ "$IPBASE2"x == x -o "$ENDSUFFIX"x == x ]; then
  echo "ERROR - Could not parse end ip from config file: $FILE"
  #echo "IPBASE2=$IPBASE2   ENDSUFFIX=$ENDSUFFIX"
  exit 134
fi

#echo "IPBASE2=$IPBASE2   ENDSUFFIX=$ENDSUFFIX"

expr $ENDSUFFIX \>= 1 >/dev/null 2>&1 && expr $ENDSUFFIX \<= 255 >/dev/null 2>&1 || { \
  echo "ERROR - End ip suffix is out of range: $ENDSUFFIX"
  exit 135
}

expr $ENDSUFFIX \< $STARTSUFFIX >/dev/null 2>&1 && { \
  echo "ERROR - End ip suffix: $ENDSUFFIX  is less than start suffix: $STARTSUFFIX"
  exit 136
}

rm -f /tmp/test_usbb_$IPBASE* >/dev/null 2>&1

#IPBASE=192.168.0
#STARTSUFFIX=2
#ENDSUFFIX=21
#rm -f /tmp/test_usbb_$IPBASE* >/dev/null 2>&1


# Send off some small pings to all IPs in the range.  We can stop early if a match is found during this phase.
GOTONE=FALSE
PIDS=
PIDGREP=0
PINGWAIT=10
for SFX in `seq $STARTSUFFIX $ENDSUFFIX`; do
  IP=$IPBASE.$SFX
#  echo $IP
  ping -w$PINGWAIT -W$PINGWAIT -c3 $IP 2>/dev/null > /tmp/test_usbb_$IP &
  PID=$!
  PIDS="$PIDS $PID"
  PIDGREP="$PIDGREP|$PID"
  if grep -q "bytes from" /tmp/test_usbb_$IPBASE* >/dev/null 2>&1; then
    GOTONE=TRUE
#    echo "Got one while still pinging. We pinged up to $IP"
    break
  else
    sleep 0.05
  fi
done
#echo PIDS=$PIDS
#ps wl | grep ping
#ls -l /tmp/1*

# If necessary, continue to wait until at least one successful ping reply is received or PINGWAIT elapses or there are no pids left
if [ $GOTONE != TRUE ]; then
  LOOPSTART=`date +%s`
  LOOPEND=`expr $LOOPSTART + $PINGWAIT + 1`
  while ls /proc 2>/dev/null | egrep -wq "$PIDGREP" >/dev/null 2>&1; do
#    echo here
    if grep -q "bytes from" /tmp/test_usbb_$IPBASE* >/dev/null 2>&1; then
      GOTONE=TRUE
#      echo "Got one while waiting after pinging them all..."
      break
    fi
    NOW=`date +%s`
    if expr $NOW \> $LOOPEND >/dev/null 2>&1; then
      echo "ERROR - Timed out waiting for any USB-B hosts to respond and pings to exit"
      rm -f /tmp/test_usbb_$IPBASE* >/dev/null 2>&1
      exit 137
    fi
    sleep 0.1
  done
fi

# Kill any/all the outstanding pings
#echo "Killing PIDS: $PIDS"
kill $PIDS >/dev/null 2>&1

# Find the IP that sent the successful ping reply (if there was one)
GOTONE=FALSE
for SFX in `seq $STARTSUFFIX $ENDSUFFIX`; do                                               
  IP=$IPBASE.$SFX                                                                          
#  echo $IP
  if grep -q "bytes from" /tmp/test_usbb_$IP >/dev/null 2>&1; then
#    echo "Got one: $IP"
    GOTONE=TRUE
    break
  fi
done 

if [ $GOTONE != TRUE ]; then
  echo "ERROR - No USB-B hosts were detected"
  rm -f /tmp/test_usbb_$IPBASE* >/dev/null 2>&1
  exit 138
fi

# Send the ping replyer some big ones - not too big or they are more likely to be dropped
SIZE=16000
GOTONE=FALSE
for N in `seq 1 3`; do
#  echo Pinging $IP with size: $SIZE, attempt $N
  if ping -w5 -W5 -c3 -s$SIZE $IP >/dev/null 2>&1; then
#    echo "Candidate USB-B host: $IP is up and replied to our pings on attempt: $N" 
    GOTONE=TRUE
    break
  fi
done

if [ $GOTONE != TRUE ]; then
  echo "ERROR - Candidate USB-B host: $IP was detected but did not reply to enough big pings after $N attempts"
  rm -f /tmp/test_usbb_$IPBASE* >/dev/null 2>&1
  exit 139                
fi                                                                                          

#date
echo "OK"
rm -f /tmp/test_usbb_$IPBASE* >/dev/null 2>&1
exit 0
