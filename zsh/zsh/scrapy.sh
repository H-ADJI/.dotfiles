#!/bin/zsh
# for scrapy fuzzy search
scrapy_fzf_insert() {
  # Run FZF with a custom appearance
  local spider=$(
    scrapy list 2>/dev/null | fzf \
      --height 40% \
      --layout=reverse \
      --border \
      \
      --prompt="Select Spider: " \
      --pointer="▶ " \
      --marker="✔ " \
      --preview="echo 'Spider: {}'" \
      --preview-window=down:1:wrap # --color=border:brightblack,gutter:-1,prompt:brightcyan,spinner:green,hl:yellow,fg:default,fg+:white,bg+:24,hl+:yellow \
  )

  # Insert the selected spider name into the command line
  if [ -n "$spider" ]; then
    LBUFFER="${LBUFFER}${spider} "
  fi
  zle redisplay
}
# Define the widget and bind it to Ctrl+f
zle -N scrapy_fzf_insert
bindkey '^f' scrapy_fzf_insert
