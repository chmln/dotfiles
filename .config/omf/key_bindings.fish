fish_vi_key_bindings;
fzf_key_bindings;

if [ $TERM = "xterm" ];
  bind \x7F 'backward-kill-bigword'
else
  bind \cH 'backward-kill-path-component'
end

bind \cp 'nvim (fd -t d --exclude "node_modules" | fzf --reverse --height=40%)'
bind \cg 'cd (fd -t d --exclude "node_modules" | fzf --reverse --height=40%)'
bind \cb "git co (git branch | sed 's/*/ /g' | sed 's/  //g' | fzf)"
bind \ck "sudo kill (ps ax | fzf | cut -f1 -d ' ')"
bind \co "fzf-cd-widget"
