#!/usr/bin/env sh

pkill connman-gtk
pkill redshift
pkill devmon
pkill watchexec
pkill unclutter

# automatically setup monitors 
auto-monitor

# wallpapers
feh --no-fehbg --bg-scale ~/.config/wallpaper ~/.config/wallpaper 

# bar
sh /home/greg/.config/i3/polybar.sh

numlockx on &

# disable bells
xset -b

# disable power saving for mice
xset s off -dpms

#disable mouse accel
xset m 0 0 &
# keyboard repeat rate
xset r rate 250 50

# russian keyboard
#setxkbmap -option grp:switch,grp:lalt_lshift_toggle us,ru ,phonetic_winkeys &

gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh &
evolution &
connman-gtk --tray &
redshift -c /home/greg/.config/redshift.conf &
devmon &
watchexec -w ~/.config/x11/xresources -- xrdb ~/.config/x11/xresources &

# hide cursor after timeout
unclutter &

sleep 5 && slack-auto &
