#!/bin/bash

#list of instances whitch need to stop
instance="3213" #("i-05b65d3c0151c4d0a i-0d2f32dd503c63c79 i-01b8cb9b43b190496")
date=`date +%y.%m.%d-%H:%M:%S`
echo "-----------------------------------------------------"
#commands
start ()
{
	echo "$date  -  Starting instance..."
	aws ec2 start-instances --instance-ids $instance
}

stop ()
{
	echo "$date  -  Stopping instances"
	aws ec2 stop-instances --instance-ids $instance
}
status ()
{
	echo "$date  -  Status instances"
aws ec2 describe-instance-status --instance-ids $instance 
}
case "$1" in
	start)
		start
		;;
	stop)
		stop
		;;
	status)
		status
		;;
	*)
		echo "Use aws.sh [start|stop|status]"

esac
