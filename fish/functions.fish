function e
   eval $EDITOR $argv
end

function ee 
  set -l path (realpath $argv[1])
  sudo -e $path
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

# disable right prompt, if any
function fish_right_prompt
end
