set DIR "/home/greg/.dotfiles/fish"
source "$DIR/variables.fish"
source "$DIR/abbreviations.fish"
source "$DIR/functions.fish"

# Start DE/WM at login
if status --is-login
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    #set -gx XAUTHORITY "/home/greg/.config/x11/xauthority"
    #sudo auto-dgpu
    #exec startx /home/greg/.config/x11/xinitrc -- -keeptty
    systemctl --user start wm.target
  end
end

