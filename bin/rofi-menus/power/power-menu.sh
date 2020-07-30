#!/bin/bash

rofi_command="rofi -theme $HOME/bin/rofi-menus/scrot/scrot-menu.rasi -dmenu"

### Options ###

# Shutdown,reboot, lock?, suspend, hibernate
options="$shutdown\n$reboot\n$suspend\n$hibernate\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "" -i)"
case $chosen in
    $shutdown)
        shutdown now
