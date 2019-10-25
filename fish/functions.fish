function e
   eval $EDITOR $argv
end

function ee
  set -l path (realpath $argv[1])
  #sudo -e $path
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
