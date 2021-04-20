#!/bin/bash

rofi_command="rofi -theme $XDG_CONFIG_HOME/rofi/menu.rasi -dmenu"

### Options ###
shut="Shutdown "
res="Restart ﰇ"
spd="Suspend 鈴"
hib="Hibernate "
log="Logout "
lock="Lock "

# Shutdown,reboot, lock?, suspend, hibernate
options="$shut\n$res\n$spd\n$hib\n$log\n$lock"

chosen="$(echo -e "$options" | $rofi_command -p "Power" -i)"
case $chosen in
    "$shut")
        shutdown now
        ;;
    "$res")
        reboot
        ;;
    "$spd")
        systemctl suspend
        ;;
    "$hib")
        systemctl hibernate
        ;;
    "$log")
        bspc quit
        ;;
    "$lock")
        i3lock -i ~/pics/misc/shinji.png
        ;;
    *)
        notify-send "No selection"
        ;;
esac
