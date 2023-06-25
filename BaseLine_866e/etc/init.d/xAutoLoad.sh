#!/bin/sh

yes="y"
YES="Y"
auto_stop="n"
AUTOLOAD_PATH="/mnt/flash"

sleep 1

if [ -x ${AUTOLOAD_PATH}/smAutoLoad ]; then
    echo -n "Do you want to stop auto start user applications (y - n(default))?"
    read -n 1 -t 3 auto_stop
    if [ -z $auto_stop ]; then
        auto_stop="n"
    fi
    echo " "
    if [ $auto_stop = $yes ] || [ $auto_stop = $YES ]; then
        echo "auto start user applications stopped by user"
		sleep 1
    else
        ${AUTOLOAD_PATH}/smAutoLoad
    fi
else
    echo "smAutoLoad file not found"
fi

sleep 1

echo " "
echo " "

exit 0
