#!/bin/bash

xrdb -merge .Xresources

if [ -x /usr/bin/xfce4-power-manager ] ; then
   sleep 1
   xfce4-power-manager &
fi

# checks if spotify is current playing
# and returns the name of artist and
# current playing song
songs () {
    func_result=$( spotify-now -e "closed" -p "paused" -i "\uf9c6 %artist - %title" )

    if [[ $func_result == "paused" ]]; then
        ans=$( spotify-now -i "%artist - %title" )
        if [[ ${#ans} -gt 44 ]]; then
            echo -e "\uf8e4  "${ans:0:44}"..."
        else
            echo -e "\uf8e4  "$ans
        fi
    elif [[ $func_result == "closed" ]]; then
        echo -e "\uf9c6 Not Playing"
    else
        if [[ ${#func_result} -gt 50 ]]; then
            echo -e ${func_result:0:50}"..."
        else
            echo -e $func_result
        fi
    fi
}

# Statusbar loop
while true; do
   xsetroot -name "`songs` | `date +"%a, %d %B %Y, %H:%M"` | `whoami`@`hostname`"
   sleep 3    # Update time every minute
done &

# remap CapsLk to Ctrl
/usr/bin/setxkbmap -option "ctrl:nocaps"

# Enabling tap to click
synclient TapButton1=1
synclient TapButton3=2
synclient TapButton2=3

# setting up wallpaper
feh --bg-scale /home/beniamin/Obrazy/Wallpapers/debian.png

exec dwm
