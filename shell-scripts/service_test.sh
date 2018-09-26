#!/bin/bash

MYFILE=/tmp/status
MYSTATUS=$(service sirportly status | awk '{ print $2 }' | awk -F"/" '{print $1}')


sirportly_restart(){
	service sirportly restart
	exit 0
}

# Remove /tmp/status if it already exists
[ -f $MYFILE ] && rm $MYFILE




# Check sirportly status
echo $MYSTATUS > $MYFILE

# Check the status and take the appropriate action
STATUS=$(cat $MYFILE)
if [ $STATUS = "start" ]; then
	logger "Sirportly is running"
	logger "Restarting Sirportly"
	sirportly_restart
elif [ $STATUS = "stop" ]; then
	logger "Sirportly is not running on this system."
	logger "Sirportly will not be restarted."
	exit 1
fi
