#!/bin/bash

# Script to test remote postfix status

# These are our servers
SERVER1=prd-leweb03b.centiq.co.uk
SERVER2=prd-noweb03b.centiq.co.uk
#SERVER1=192.168.0.105
#SERVER2=192.168.0.202

PORT=25  #Postfix port

SERVER1_PING_STATUS=""
SERVER2_PING_STATUS=""


SERVER1_PF_STATUS=""
SERVER2_PF_STATUS=""

# First let's test if the boxes are up
if ping -c 1 $SERVER1 > /dev/null; then
    SERVER1_PING_STATUS="HOST AVAILABLE"
else
    SERVER1_PING_STATUS="CONNECTION ERROR!"
fi


if ping -c 1 $SERVER2 > /dev/null; then
    SERVER2_PING_STATUS="HOST AVAILABLE"
else
    SERVER2_PING_STATUS="CONNECTION ERROR!"
fi

# Here we check the status of port 25 for Postfix
# If it's open - postfix is running
if  (nc -i 2  $SERVER1 $PORT  | grep -i postfix) > /dev/null 2>&1; then
    SERVER1_PF_STATUS="RUNNING"   
else
    SERVER1_PF_STATUS="NOT RUNNING" 
fi

if  (nc -i 2  $SERVER2 $PORT | grep -i postfix) > /dev/null 2>&1; then
    SERVER2_PF_STATUS="RUNNING"   
else
    SERVER2_PF_STATUS="NOT RUNNING" 
fi

# If we can't connect to the server, we need to say so.
# What we're doing here is changing the postfix status
# variable to reflect that connectivity is an issue
if [ "$SERVER1_PING_STATUS" == "CONNECTION ERROR!" ]; then
    SERVER1_PF_STATUS=$SERVER1_PING_STATUS
fi

if [ "$SERVER2_PING_STATUS" == "CONNECTION ERROR!" ]; then
    SERVER1_PF_STATUS=$SERVER2_PING_STATUS
fi

# Here comes the Monitiq output
echo "ma_name: postfix_status"
echo "ma_group_name: Postfix"
echo "ma_short_name: ptfx"
echo "ma_mon_order: 10"
echo "ma_keys: Host 1 @@@ Host 2"
echo "ma_data:"
echo "Host 1 @@@ Host 1 Status @@@ Host 2 @@@ Host 2 Status"
echo  $SERVER1 " @@@ " $SERVER1_PF_STATUS " @@@ "  $SERVER2 " @@@ " $SERVER2_PF_STATUS

