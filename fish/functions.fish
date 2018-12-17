function e
   eval $EDITOR $argv
end

function ee 
  set -l path (realpath $argv[1])
  sudo -e $path
end

function l
  exa -1a --group-directories-first $argv
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
  yaourt -Syua $argv
  if [ -n $argv[2] ]
    maintenance
  end
end

# disable right prompt, if any
function fish_right_prompt
end
