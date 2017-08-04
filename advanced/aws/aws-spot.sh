#!/bin/bash
WORKTIME=$(date -d "+1 hours" +"%s")
aws ec2 request-spot-instances --spot-price "0.016" --instance-count 1 --type "one-time" --launch-specification file://aws-spot.json --valid-until $WORKTIME
