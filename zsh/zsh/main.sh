# starship prompt customization (should be first)
# shellcheck disable=all
source ~/zsh/starship.sh
source ~/zsh/zinit/init.sh
source ~/zsh/aliases.sh
source ~/zsh/android.sh
source ~/zsh/bat.sh
source ~/zsh/completions.sh
source ~/zsh/direnv.sh
source ~/zsh/eza.sh
source ~/zsh/fzf.sh
source ~/zsh/git.sh
source ~/zsh/go.sh
source ~/zsh/kitty.sh
source ~/zsh/leetcode.sh
source ~/zsh/nala.sh
source ~/zsh/npm.sh
source ~/zsh/nvim.sh
source ~/zsh/path.sh
source ~/zsh/python.sh
source ~/zsh/rust.sh
source ~/zsh/scrapy.sh
source ~/zsh/tmuxifier.sh
source ~/zsh/utils.sh
source ~/zsh/uv.sh
source ~/zsh/zoxide.sh
source ~/zsh/zsh.sh
# # emacs keybinds
# bindkey -e
# bindkey '^p' history-search-backward
# bindkey '^n' history-search-forward
# # history
# HISTSIZE=5000
# SAVEHIST=$HISTSIZE
# HISTFILE=~/.zsh_history
# HISTDUP=erase
# setopt appendhistory
# setopt sharehistory
# setopt hist_ignore_all_dups
# setopt hist_save_no_dups
# setopt hist_ignore_dups
# setopt hist_find_no_dups
#
# # completion case insensitive
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-Z}'
# zstyle ':completion:*' menu no
#

# Add in zsh plugins
# zinit light zsh-users/zsh-syntax-highlighting
# zinit light zsh-users/zsh-autosuggestions
# zinit light Aloxaf/fzf-tab

# Add in snippets
# zinit snippet OMZL::git.zsh

# Load completions
# autoload -Uz compinit && compinit

# zinit cdreplay -q
# Keybindings
# bindkey -e
# bindkey '^p' history-search-backward
# bindkey '^n' history-search-forward
# bindkey '^[w' kill-region

# History
# HISTSIZE=5000
# HISTFILE=~/.zsh_history
# SAVEHIST=$HISTSIZE
# HISTDUP=erase
# setopt appendhistory
# setopt sharehistory
# setopt hist_ignore_space
# setopt hist_ignore_all_dups
# setopt hist_save_no_dups
# setopt hist_ignore_dups
# setopt hist_find_no_dups

# Completion styling
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# zstyle ':completion:*' menu no
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
# zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Shell integrations
# eval "$(fzf --zsh)"
# eval "$(zoxide init --cmd cd zsh)"
