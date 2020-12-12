for conf in $HOME/.dotfiles/systemd/environment.d/*
    cat $conf | sd '^(#.*)?\n' '' | sd '^(.*?)=(.*)$' 'set $1 $2' | envsubst | source
end
