#!/bin/zsh
# for scrapy fuzzy search
scrapy_fzf_spiders() {
  # Run FZF with a custom appearance
  local spider=$(
    scrapy list 2>/dev/null | fzf --height 40% --layout=reverse \
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
