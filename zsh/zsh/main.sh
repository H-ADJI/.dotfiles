# starship prompt customization (should be first)
# shellcheck disable=all
source ~/zsh/lib/starship.sh
source ~/zsh/zinit/init.sh
source ~/zsh/lib/aliases.sh
source ~/zsh/lib/android.sh
source ~/zsh/lib/bat.sh
source ~/zsh/lib/completions.sh
source ~/zsh/lib/direnv.sh
source ~/zsh/lib/eza.sh
source ~/zsh/lib/fzf.sh
source ~/zsh/lib/fzf-git.sh
source ~/zsh/lib/git.sh
source ~/zsh/lib/go.sh
source ~/zsh/lib/kitty.sh
source ~/zsh/lib/leetcode.sh
source ~/zsh/lib/nala.sh
source ~/zsh/lib/npm.sh
source ~/zsh/lib/nvim.sh
source ~/zsh/lib/path.sh
source ~/zsh/lib/python.sh
source ~/zsh/lib/rust.sh
source ~/zsh/lib/scrapy.sh
source ~/zsh/lib/tmuxifier.sh
source ~/zsh/lib/utils.sh
source ~/zsh/lib/uv.sh
source ~/zsh/lib/zoxide.sh
source ~/zsh/lib/zsh.sh
source ~/zsh/lib/keybinds.sh
source ~/zsh/lib/history.sh
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
