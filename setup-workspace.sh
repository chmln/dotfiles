#!/usr/bin/bash
echo -n "" > workspace.sh

traverse () {
  path=$1
  echo "Traversing $path ..."
  for dir in `fd --type d --max-depth 1 ".*" $path`
    do
      echo $dir
      giturl=$(git --git-dir=$dir/.git remote get-url origin);
      if [ $? -eq 0 ]; then
        echo "git clone $giturl &" >> workspace.sh
      elif [[ $dir != *"node_modules" && $dir != *"target" ]]; then
        folder=$(basename $dir)
        echo "mkdir $folder" >> workspace.sh
        echo "cd $folder" >> workspace.sh
        traverse $dir
        echo "cd .." >> workspace.sh
      fi
    done
}

traverse "/home/greg/Workspace"
