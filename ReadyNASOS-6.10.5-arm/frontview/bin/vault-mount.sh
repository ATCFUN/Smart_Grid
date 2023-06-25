#!/bin/bash

if [ ! -d "/vault" ]; then
  mkdir /vault
fi

if [ ! -e /etc/default/services ]; then
  echo "The default service file not exist"
  exit 1;
fi

DATA=`awk -F "=" '$1~/^READYNASVAULT_TEP_FOLDER$/{print $2}' /etc/default/services`

echo $DATA
if [ "$DATA" == "0" ]; then
  echo "The value of READYNASVAULT_TEP_FOLDER is NULL"
  exit 1;
fi

mount --bind "/$DATA/.vault" /vault
