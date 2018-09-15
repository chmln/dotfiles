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
abbr -a rdd "sudo pacman -Rdd"
abbr -a ditch "sudo pacman -Rnss"
abbr -a findpkg "pacman -Qss"
abbr -a updater "yaourt -Syua"
abbr -a aur "yaourt"
abbr -a rmall "sudo rmall"
abbr -a maintenance "sudo paccache -ruk0; sudo pacman -Rns (pacman -Qtdq)"

# services
abbr -a start "sudo systemctl start"
abbr -a restart "sudo systemctl restart"
abbr -a stop "sudo systemctl stop"
abbr -a disable "sudo systemctl disable"
abbr -a enable "sudo systemctl enable"
abbr -a status "sudo systemctl status"
# misc
abbr -a gs "git status"
abbr -a c "clear"
abbr -a sl "adb sideload"
abbr -a mp3 "lame --preset insane"

abbr -a update-grub "sudo grub-mkconfig -o /boot/grub/grub.cfg"

function e
   eval $EDITOR $argv
end

function fish_title
  echo $_ ' '
  pwd
end

function l
  exa -1a --group-directories-first $argv
end

function cat
  /usr/bin/bat --theme=TwoDark --style plain $argv
end

# Start DE/WM at login
if status --is-login
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx -- -keeptty
  end
end

function opendir
  set dir (fd -t d --exclude "node_modules" | fzf --reverse --height=40%)
  if $dir
    nvim $dir
  end
end

bind \co opendir
bind \cp 'nvim (fd -t f -H --exclude "node_modules" | fzf --reverse --height=40%)'
bind \cn "nohup xterm >/dev/null 2>&1"
bind \cg 'cd (fd -t d --exclude "node_modules" | fzf --reverse --height=40%)'
bind \cb "git co (git branch | sed 's/*/ /g' | sed 's/  //g' | fzf)"
bind \ck "sudo kill (ps ax | fzf | cut -f1 -d ' ')"
