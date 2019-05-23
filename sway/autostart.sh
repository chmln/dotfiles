#!/bin/sh

pkill mako
pkill devmon
pkill unclutter
pkill swaybg

sh ~/.config/sway/waybar.sh &

swaybg -o "*" -i ~/.config/wallpaper &

# disable bells
xset -b

# disable power saving for mice
xset s off -dpms

#disable mouse accel
xset m 0 0 &

# keyboard repeat rate
xset r rate 250 50

# load xresources
xrdb ~/.config/x11/xresources &


# blue-light filter
redshift -c ~/.config/redshift.conf -m wayland &

# auto-mount plugged in usb devices
devmon &

# check for missed email notifications
~/.config/mbsync/boot.sh &
