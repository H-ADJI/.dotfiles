# Setup fzf
# ---------
if [[ ! "$PATH" == */home/khalil/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/khalil/.fzf/bin"
fi

source <(fzf --zsh)
