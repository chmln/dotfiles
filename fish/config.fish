set DIR "/home/greg/.dotfiles/fish"
source "$DIR/variables.fish"
source "$DIR/abbreviations.fish"
source "$DIR/functions.fish"

# Start DE/WM at login
if status --is-login
  if [ "$XDG_VTNR" = "1" ]
    systemctl --user start wm.target
  end
end

