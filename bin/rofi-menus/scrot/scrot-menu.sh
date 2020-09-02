#!/bin/bash

rofi_command="rofi -theme $HOME/bin/rofi-menus/menu.rasi -dmenu"

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
        scrot /tmp/temp_shot.png
        xclip -selection clipboard -i -t image/png /tmp/temp_shot.png
        notify-send -i "~/pics/misc/cheese.png" "Cheese!" "Saved to clipboard"
        ;;
    $screenFile)
        sleep 0.2 
        scrot $HOME/'pics/screenshots/%Y-%m-%d_%H%M%S.png'
        notify-send -i "~/pics/misc/cheese.png" "Cheese!" "Saved to ~/pics/screenshots"
        ;;
    $windowClip)
        sleep 0.2  
        scrot -u /tmp/temp_shot.png
        xclip -selection clipboard -i -t image/png /tmp/temp_shot.png
        notify-send -i "~/pics/misc/cheese.png" "Cheese!" "Saved to clipboard"
        ;;
    $windowFile)
        sleep 0.2
        scrot -u $HOME/'pics/screenshots/%Y-%m-%d_%H%M%S.png'
        notify-send -i "~/pics/misc/cheese.png" "Cheese!" "Saved to ~/pics/screenshots"
        ;;
    $areaClip)
        sleep 0.2 
        scrot -s /tmp/temp_shot.png
        xclip -selection clipboard -i -t image/png /tmp/temp_shot.png
        notify-send -i "~/pics/misc/cheese.png" "Cheese!" "Saved to clipboard"
        ;;  
    $areaFile)
        sleep 0.2
        scrot -s $HOME/'pics/screenshots/%Y-%m-%d_%H%M%S.png'
        notify-send -i "~/pics/misc/cheese.png" "Cheese!" "Saved to ~/pics/screenshots"
        ;;
esac
