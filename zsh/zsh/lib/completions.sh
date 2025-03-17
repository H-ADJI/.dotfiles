autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc

# Case insensitive completion match
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# colored preview
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --color=always $realpath'
# disable default menu completion to allow effective fzf completions
zstyle ':completion:*' menu no
