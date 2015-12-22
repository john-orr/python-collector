#!/bin/sh
echo "COM PORT: $2"
python elitech-device.py --command simple-set --interval=10 $2
echo "Location: $1"
read -n1 -r -p "Hold play button on thermometer for 5 seconds. Press any key to continue."
echo "Started"
LAST_NUM=0
while true
do
    LAST_NUM=$(python elitech-device.py --command get --last_num $LAST_NUM --location $1 $2)	
    sleep 10
done