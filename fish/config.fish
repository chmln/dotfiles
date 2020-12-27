set DIR "$HOME/.dotfiles/fish"

source "$DIR/platform/_index.fish"
source "$DIR/variables.fish"
source "$DIR/abbreviations.fish"
source "$DIR/functions.fish"

# Start DE/WM at login
if status --is-login
  if [ "$XDG_VTNR" = "1" -a "$platform" = "linux" ]
    systemctl --user start wm.target
  end
end
