#!/bin/zsh
# safe gards to not break gloabal python installation
function cd() {
  builtin cd "$@" # Call the built-in cd command
  if [ -f "./venv/bin/activate" ]; then
    source ./venv/bin/activate
  fi
}
