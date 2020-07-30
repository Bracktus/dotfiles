#!/bin/bash

#Takes screenshot
scrot /tmp/screenshot.png

#Adds blur to screenshot
convert /tmp/screenshot.png -blur 0x5 /tmp/screenshotblur.png

#Adds lock logo to screenshot
#convert /tmp/screenshotblur.png /home/bracktus/Pictures/misc/lockIcon.png -gravity center -composite /tmp/screenshotblurlock.png

#Sets the lock screen
i3lock -u -i /tmp/screenshotblur.png 

