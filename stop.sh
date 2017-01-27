#!/bin/sh
# Copyright (C) 2017 Alexander Hammond

SERVER_FILE="tmp/pids/server.pid"
if [ -f $SERVER_FILE ]; then
	SERVER_PID=`cat tmp/pids/server.pid`
	kill $SERVER_PID &
fi

# Make sure is killed
if [ -f $SERVER_FILE ]; then
	sleep 2
	kill -4 $SERVER_PID
fi
