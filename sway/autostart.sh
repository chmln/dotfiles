#!/bin/sh

pkill devmon
pkill swaybg
pkill redshift

sh ~/.config/sway/waybar.sh &

swaybg -o "*" -i ~/.config/wallpaper &

# blue-light filter
redshift -c ~/.config/redshift.conf -m wayland &

# auto-mount plugged in usb devices
devmon &

# check for missed email notifications
~/.config/mbsync/boot.sh &
