#!/usr/bin/env bash
export DISPLAY=:0
export XAUTHORITY=/home/bracktus/.Xauthority
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

BATTERY=$(cat /sys/class/power_supply/BAT0/capacity)
STAT=$(cat /sys/class/power_supply/BAT0/status)

if [ "${BATTERY}" -lt 20 ] && [ "${STAT}" = "Discharging" ];
then
	notify-send -u critical "LOW BATTERY: $BATTERY"
fi
