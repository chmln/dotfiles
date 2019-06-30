set DIR "/home/greg/.dotfiles/fish"
source "$DIR/variables.fish"
source "$DIR/abbreviations.fish"
source "$DIR/functions.fish"

# Start DE/WM at login
if status --is-login
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    #exec startx /home/greg/.config/x11/xinitrc -- -keeptty
    eval (/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
    export SSH_AUTH_SOCK
    exec sway
    #systemctl --user import-environment
    # then start the service
    # exec systemctl --wait --user start sway.service
  end
end
