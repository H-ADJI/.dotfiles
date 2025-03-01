source ~/zsh/zsh.zsh
source ~/zsh/direnv.zsh
source ~/zsh/settings.zsh
source ~/zsh/path.zsh
source ~/zsh/aliases.zsh
source ~/zsh/custom_addons.zsh
source ~/zsh/fzf.zsh
source ~/zsh/scrapy.zsh
source ~/zsh/tmux.zsh
source ~/zsh/zoxide.zsh
source ~/zsh/uv.zsh
source ~/zsh/leetcode.zsh

fpath+=~/.zfunc; autoload -Uz compinit; compinit

zstyle ':completion:*' menu select
