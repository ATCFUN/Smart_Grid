#!/bin/bash

SERVER=192.168.125.1

if ping -c2 -W2 $SERVER >/dev/null 2>&1; then
  mkdir /run/btest
  cd /run/btest
  if timeout 10 tftp -g -r server.info -l - $SERVER 2>/dev/null | grep -q "RAIDiator"; then
    if timeout 10 tftp -g -r btest $SERVER 2>/dev/null; then
      logger "Running factory test script..."
      . btest
    else
      logger -s "No factory test script found"
    fi
  else
    logger -s "No factory server found"
  fi
else
  logger -s "Not on factory network"
fi

systemctl disable readynas-factory.service
