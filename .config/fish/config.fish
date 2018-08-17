set PATH -g /home/greg/.npm-global/bin/ $PATH
set PATH -g /home/greg/.config/bin/ $PATH
set PATH -g /home/greg/.config/yarn/global/node_modules/.bin/ $PATH
set PATH -g /home/greg/.cargo/bin/ $PATH
set PATH -g /home/greg/.local/lib/python3.6/site-packages $PATH
set PATH -g /home/greg/.local/bin/ $PATH

set EDITOR "nvim"
set -gx FZF_DEFAULT_COMMAND 'fd --type f'

set fish_greeting ""
set fish_cursor_default block
set fish_cursor_insert line

# package management
abbr -a get "yaourt -S"
abbr -a r "sudo pacman -Rn"
abbr -a rmpkg "sudo pacman -R"
abbr -a rdd "sudo pacman -Rdd"
abbr -a ditch "sudo pacman -Rnss"
abbr -a findpkg "pacman -Qss"
abbr -a updater "yaourt -Syua"
abbr -a aur "yaourt"
abbr -a rmall "sudo rmall"
abbr -a rmorphans "sudo pacman -Rns (pacman -Qtdq)"
abbr -a maintenance "sudo paccache -ruk0; sudo pacman -Rns (pacman -Qtdq)"

# services
abbr -a start "sudo systemctl start"
abbr -a restart "sudo systemctl restart"
abbr -a stop "sudo systemctl stop"
abbr -a disable "sudo systemctl disable"
abbr -a enable "sudo systemctl enable"

# misc
abbr -a gs "git status"
abbr -a c "clear"
abbr -a sl "adb sideload"
abbr -a mp3 "lame --preset insane"

abbr -a update-grub "sudo grub-mkconfig -o /boot/grub/grub.cfg"

function e
   eval $EDITOR $argv
end

function l
  exa -1a --group-directories-first $argv
end

function bat
  /usr/bin/bat --theme=TwoDark --style changes,numbers,grid $argv
end

# Start DE/WM at login
if status --is-login
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx -- -keeptty
  end
end


