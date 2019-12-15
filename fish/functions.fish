function e
   eval $EDITOR $argv
end

function ee
  set -l path (realpath $argv[1])
  sudoedit $path
end

function l
  env COLUMNS=80 exa -a -1 --group-directories-first $argv --color=always | less -FR
end

function cat
  /usr/bin/bat --theme=TwoDark --style plain $argv
end

function maintenance
  sudo paccache -ruk0
  sudo pacman -Rns --noconfirm (pacman -Qtdq)
end

function updater
  yay -Syu $argv[1] --noconfirm
  # circular dependency :(
  sudo rmall python-sphinx
  maintenance
  return 0
end

function mvp -d "move and create dir if needed"
  mkdir -p (dirname "$argv[2]")
  mv "$argv[1]" "$argv[2]"
end

# disable right prompt, if any
function fish_right_prompt
end

function fish_greeting
end

function bobthefish_colors -S -d 'Define a custom bobthefish color scheme'
  __bobthefish_colors zenburn
  set -x color_repo_dirty E1AA5D 333333
  set -x color_path_nowrite 333333 DCDCCC
  set -x color_path_nowrite_basename 333333 DCDCCC --bold
end

function visual_mode
  commandline -f forward-char
  set fish_bind_mode visual
  commandline -f begin-selection
end


function fish_clipboard_copy
    set -l cmdline (commandline --current-selection)
    test -n "$cmdline"; or set cmdline (commandline)
    printf '%s\n' $cmdline | xsel -b >/dev/null

    commandline -f end-selection
    set fish_bind_mode insert
    commandline -f end-of-line
    commandline -f repaint
end

