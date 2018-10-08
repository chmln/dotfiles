#!/usr/bin/bash
function main_list {
  ls -1 /usr/share/applications 
}

function start_launcher {
  result=$(main_list | fzy)
  if test -n $result; then
    case $result in
      "*desktop")
        name=$(echo $result | sed s/.desktop//)
        echo $name > /home/greg/res
        gtk-launch $name &
        disown
        sleep 1
        ;;
      "*")
        xdg-open $result
      ;;
  esac
  fi 
}

function launcher_main {
  xterm -geometry 50x8+0+0 -class FXTerm -e "bash -c 'eval 'start_launcher''"
}
