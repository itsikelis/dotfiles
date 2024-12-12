fpath+=($HOME/.config/zsh/pure)

autoload -U promptinit; promptinit
prompt pure

# history
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=5000
export SAVEHIST=$HISTSIZE
export HISTDUP=erase

setopt sharehistory
setopt appendhistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

bindkey '^j' history-search-forward
bindkey '^k' history-search-backward

# source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fpath=(path/to/zsh-completions/src $fpath)

# Completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# zstyle ':completion:*' menu no
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
# zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

alias c='clear'

# ls aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# eval "$(fzf --zsh)" # Use fzf for fuzzy searching

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
