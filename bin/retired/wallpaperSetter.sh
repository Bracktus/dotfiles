#!/bin/bash

#A script to randomly select a wallpaper and then use pywal to customise other apps.


#If there aren't any arguments set it to a random one
if [ "$#" = "0" ]; then
	wallpaper=$(ls ~/Pictures/wallpapers | shuf -n 1)
	feh --bg-fill ~/Pictures/wallpapers/${wallpaper}
	wal -i ~/Pictures/wallpapers/${wallpaper} -n
fi


#If there is only one argument then set it to that wallpaper (if it exists)
if [ "$#" = "1" ] && [ -f $1 ]; then
	feh --bg-fill $1
	wal -i $1 -n
fi
