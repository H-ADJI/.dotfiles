# initilizing and loading auto-completions
autoload -Uz compinit && compinit -C

# adding completiong function for nala - typer-cli to fpath
fpath+=~/.zfunc

# Case insensitive completion match
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# colored preview
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --color=always $realpath'

# to cycle through suggestion using tab - disabled when using fzf-tab
# zstyle ':completion:*' menu select
# disable default menu completion to allow effective fzf completions
zstyle ':completion:*' menu no
