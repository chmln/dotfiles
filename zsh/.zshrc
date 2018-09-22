source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# ====== Autocomplete
CASE_SENSITIVE="false"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
autoload -U compinit && compinit

# ====== PROMPT
source ~/.dotfiles/zsh/agnoster.zsh
precmd_functions+=(prompt_agnoster_precmd)
# ====== HISTORY
HISTFILE=~/.config/zsh/history
SAVEHIST=10000
HISTSIZE=10000
setopt APPEND_HISTORY

# ====== Keybinds
source ~/.dotfiles/zsh/keybinds.zsh
