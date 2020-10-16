#!/bin/bash

rofi_command="rofi -theme $XDG_CONFIG_HOME/rofi/menu.rasi -dmenu"

### Options ###
screenClip="   Screen (Save to clipboard)"
areaClip=" 麗  Area (Save to clipboard)"
windowClip="   Window (Save to clipboard)"
screenFile="   Screen (Save to file)"
areaFile=" 麗  Area (Save to file)"
windowFile="   Window (Save to file)"

# Variable passed to rofi
options="$screenClip\n$screenFile\n$windowClip\n$windowFile\n$areaClip\n$areaFile"

chosen="$(echo -e "$options" | $rofi_command -p "Screenshot" -i)"
case $chosen in
    $screenClip)
        sleep 0.2 
        maim | xclip -selection clipboard -t image/png
        notify-send -i "~/pics/misc/cheese.png" "Cheese!" "Saved to clipboard"
        ;;
    $screenFile)
        sleep 0.2 
        maim ~/pics/screenshots/$(date +%Y-%m-%d_%H%M%S).png
        notify-send -i "~/pics/misc/cheese.png" "Cheese!" "Saved to ~/pics/screenshots"
        ;;
    $windowClip)
        sleep 0.2  
        maim -i $(xdotool getactivewindow) | xclip -selection clipboard -t image/png
        notify-send -i "~/pics/misc/cheese.png" "Cheese!" "Saved to clipboard"
        ;;
    $windowFile)
        sleep 0.2
        maim -i $(xdotool getactivewindow) ~/pics/screenshots/$(date +%Y-%m-%d_%H%M%S).png
        notify-send -i "~/pics/misc/cheese.png" "Cheese!" "Saved to ~/pics/screenshots"
        ;;
    $areaClip)
        sleep 0.2 
        maim -s | xclip -selection clipboard -t image/png
        notify-send -i "~/pics/misc/cheese.png" "Cheese!" "Saved to clipboard"
        ;;  
    $areaFile)
        sleep 0.2
        maim -s ~/pics/screenshots/$(date +%Y-%m-%d_%H%M%S).png
        notify-send -i "~/pics/misc/cheese.png" "Cheese!" "Saved to ~/pics/screenshots"
        ;;
esac
