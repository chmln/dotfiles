DOTS="/home/greg/.dotfiles/zsh"
source "$DOTS/constants.zsh"


# ====== Autocomplete
CASE_SENSITIVE="false"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.config/zsh/cache
autoload -U compinit && compinit

# ====== PROMPT
source "$DOTS/prompt.zsh"
precmd_functions+=(prompt_agnoster_precmd)

# ====== HISTORY
HISTFILE=~/.config/zsh/history
SAVEHIST=10000
HISTSIZE=10000
setopt APPEND_HISTORY

# ====== Keybinds
source "$DOTS/vim_mode.zsh"
source "$DOTS/keybinds.zsh"
source "$DOTS/abbreviations.zsh"

source "$DOTS/../sick-launcher/run.sh"

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

# ====== Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
