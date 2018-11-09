#!/usr/bin/env sh

pkill nm-applet
pkill redshift
pkill udiskie
pkill watchexec

# monitors
auto-monitor

# wallpapers
feh --bg-scale ~/.config/wallpaper ~/.config/wallpaper 

# bar
sh /home/greg/.config/i3/polybar.sh

#numlock on
numlockx on &

#disable mouse accel
xset m 0 0 &
# keyboard repeat rate
xset r rate 250 50
#setxkbmap -option grp:switch,grp:lalt_lshift_toggle us,ru ,phonetic_winkeys &

# apps
xrdb /home/greg/.Xresources &
gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh &
evolution &
nm-applet &
redshift -c /home/greg/.config/redshift.conf &
udiskie &
watchexec -w ~/.Xresources -- xrdb ~/.Xresources &
sleep 5 && slack-auto &
