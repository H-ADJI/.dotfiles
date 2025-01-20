eval "$(leetcode completions)"
fzf_leetcode_problems() {
  local cmd="lc list -c algorithms -q L"
  local problem=$(
    lc list -c algorithms -q L | fzf --height 60% --layout=reverse --border --prompt="Select Problem: " --pointer="▶ " --marker="✔ " --preview-window=down:1:wrap
  )
  # problem=$(echo $problem | grep -oP "(?<=\[ )\d+")
  local parsed=$(echo $problem | grep -oP "\s*\d+\s*(?=\])")
  # Insert the selected spider name into the command line
  if [ -n "$problem" ]; then
    LBUFFER="lc edit ${LBUFFER}${parsed} "
  fi
  zle redisplay
}
# Define the widget and bind it to Ctrl+f
zle -N fzf_leetcode_problems
bindkey '^n' fzf_leetcode_problems
