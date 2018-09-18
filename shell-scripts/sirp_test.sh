#!/bin/bash

##
# ssleaford@centiq.co.uk

# Short script to check the status of the sirportly service
# to allow logrotate to only restart the service if necessary
# 
# Usage: Add path to this script to the postrotate section of /etc/logrotate.d/sirportly
#
#/opt/sirportly/log/*.log {
#        weekly
#        missingok
#        rotate 52
#        dateext
#        compress
#        delaycompress
#        notifempty
#        create 0664 sirportly sirportly
#        sharedscripts
#        postrotate
# this needs a test to check that sirportly is running before this is called (we don't want to start this in the middle of the night if it has been disabled do we)
#                /root/bin/sirp_test.sh           
#        endscript
#
#}






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
