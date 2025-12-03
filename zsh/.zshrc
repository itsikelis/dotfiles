fpath+=($HOME/.config/zsh/plugins/pure)

autoload -U promptinit; promptinit
prompt pure

# Locale
export LC_CTYPE=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8

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

source ~/.config/zsh/plugins/zsh-completions/zsh-completions.plugin.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fpath+=($HOME/.config/zsh/plugins/zsh-completions/src)

# Completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
autoload -Uz compinit && compinit

zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

alias c='clear'

# ls aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias l='ls -CF'
alias la='ls -ACF'

# vi alias
alias vi='nvim'

eval "$(fzf --zsh)" # Use fzf for fuzzy searching

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(ssh-agent -s)" > /dev/null
ssh-add ~/.ssh/github 2> /dev/null
ssh-add ~/.ssh/gitlab 2> /dev/null

fpath+=${ZDOTDIR:-~}/.zsh_functions
