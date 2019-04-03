function e
   eval $EDITOR $argv
end

function ee
  set -l path (realpath $argv[1])
  sudo -e $path
end

function l
  env COLUMNS=80 exa -a -1 --group-directories-first $argv --color=always | less -FR
end

function cat
  /usr/bin/bat --theme=TwoDark --style plain $argv
end

#function fish_title
#  if set -gq TITLE
#    echo $TITLE
#  else
#    echo (status current-command)
#  end
#end

function maintenance
  sudo paccache -ruk0
  sudo pacman -Rns --noconfirm (pacman -Qtdq)
end

function updater
  yaourt -Syu $argv
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
