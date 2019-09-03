#!/bin/sh

pkill devmon
pkill redshift

auto-monitor

# wallpapers
feh --no-fehbg --bg-scale ~/.config/wallpaper ~/.config/wallpaper

# bar
sh ~/.config/i3/polybar.sh

# force turn on numlock
numlockx on &

# disable bells
xset -b

# disable power saving for mice
xset s off -dpms

#disable mouse accel
xset m 0 0 &

# keyboard repeat rate
xset r rate 250 85

# russian keyboard
setxkbmap -option grp:win_space_toggle us,ru,am ,phonetic_winkeys,phonetic &

# load xresources
xrdb ~/.config/x11/xresources &

redshift -c ~/.config/redshift.conf &

# auto-mount plugged in usb devices
devmon --exec-on-drive "notify-send 'Mounted %l at %d'" &


