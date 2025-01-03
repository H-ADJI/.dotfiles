#!/bin/zsh
# for scrapy fuzzy search
scrapy_fzf_spiders() {
  # Run FZF with a custom appearance
  touch /tmp/spiders.tmp
  if command -v scrapy &>/dev/null; then
    scrapy list 2>/dev/null 1>/tmp/spiders.tmp
  else
    print -P "\nCurrent directory is not a %B%F{green}scrapy%b%f project directory, using cached spider list"
  fi
  zle redisplay
  local spider=$(
    cat /tmp/spiders.tmp | fzf --height 40% --layout=reverse \
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
zle -N scrapy_fzf_spiders
bindkey '^f' scrapy_fzf_spiders
