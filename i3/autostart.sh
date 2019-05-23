#!/bin/sh

pkill redshift
pkill devmon
pkill unclutter

# automatically setup monitors
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
xset r rate 250 75

# russian keyboard
setxkbmap -option grp:win_space_toggle us,ru,am ,phonetic_winkeys,phonetic &

# blue-light filter
redshift -c ~/.config/redshift.conf &

# load xresources
xrdb ~/.config/x11/xresources &

# auto-mount plugged in usb devices
devmon --exec-on-drive "notify-send 'Mounted %l at %d'" &

# hide cursor after timeout
unclutter &

# check for missed email notifications
~/.config/mbsync/boot.sh &
