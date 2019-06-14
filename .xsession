#!/bin/bash

xrdb -merge .Xresources

if [ -x /usr/bin/xfce4-power-manager ] ; then
   sleep 1
   xfce4-power-manager &
fi

dmenu_path &
redshift &
dunst &
~/.scripts/mystatus &

# remap CapsLk to Ctrl
/usr/bin/setxkbmap -option "ctrl:nocaps"

# Enabling tap to click
synclient TapButton1=1
synclient TapButton3=2
synclient TapButton2=3

# setting up wallpaper
feh --bg-fill /home/beniamin/Obrazy/Wallpapers/dog.jpg

exec dwm
