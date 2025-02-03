#!/bin/zsh

shub_deploy() {
  shub image upload $SHUB_DEVZONE --build-arg PYPI_SECRET=$PYPI_SECRET
}
# to persist spiders list, may cause inconsistencies
PERSIST_SPIDERS=1

fzf_spiders() {
  # Run FZF with a custom appearance
  cache_dir="$HOME/.local/share/scrapy"
  cache_file="/tmp/spiders.tmp"

  if [ $PERSIST_SPIDERS -eq 1 ]; then
    mkdir -p $cache_dir
    cache_file="$cache_dir/scrapy"
  fi

  if command -v scrapy &>/dev/null; then
    touch $cache_file
    scrapy list 2>/dev/null 1>$cache_file
  else
    print -P "\n%F{yellow}Using cached spider list (Last update: $(date -r "$cache_file" '+%m-%d-%Y %H:%M:%S' 2>/dev/null))%f"
  fi

  zle redisplay
  local spider=$(
    cat $cache_file 2>/dev/null | fzf --height 40% --layout=reverse \
      --border --prompt="Select Spider: " --pointer="▶ " --marker="✔ " \
      --preview="echo 'Spider: {}'" --preview-window=down:1:wrap
  )

  # Insert the selected spider name into the command line
  if [ -n "$spider" ]; then
    LBUFFER="${LBUFFER}${spider} "
  fi
  zle redisplay
}
# Define the widget and bind it to Ctrl+f
zle -N fzf_spiders
bindkey '^f' fzf_spiders
