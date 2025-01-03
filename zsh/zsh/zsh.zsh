#!/bin/zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
zstyle ':omz:update' mode auto      # update automatically without asking
# You can also set it to another string to have that shown instead of the default red dots.
COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"
plugins=(evalcache direnv git npm docker docker-compose)
source $ZSH/oh-my-zsh.sh
autoload -Uz compinit
zstyle ':completion:*' menu select
# nala completion
fpath+=~/.zfunc
