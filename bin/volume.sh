#!/bin/bash

# You can call this script like this:
# ./volume.sh up
# ./volume.sh down
# ./volume.sh mute

sinks=$(pactl list short sinks)
lines=$(echo "$sinks" | wc -l)

if [ "$lines" -gt 1 ]
then 
    sink=$(echo "$sinks" | grep "RUNNING" | cut -c 1)
else
    sink=$(echo "$sinks" | cut -c 1)
fi

# There's probably a messed up awk way to do this more efficiently but idc

case $1 in
    up)	
	    pactl set-sink-volume "$sink" +2%	
        ;;
    down)
        pactl set-sink-volume "$sink" -2%
		;;
    mute)
        pactl set-sink-mute "$sink" toggle 
        ;;
esac
