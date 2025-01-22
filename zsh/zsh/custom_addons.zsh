#!/bin/bash
# safe gards to not break gloabal python installation
# function cd() {
#   builtin cd "$@" # Call the built-in cd command
#   if [ -f "./venv/bin/activate" ]; then
#     source ./venv/bin/activate
#   fi
# }
add_note() {
  echo "- $1" >>~/secondBrain/ideas.md
  bat ~/secondBrain/ideas.md
}
