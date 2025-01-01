#!/bin/zsh
alias zshconfig="cd ~/zsh && nv"
alias tmuxconfig="nv ~/.tmux.conf"
alias kittyconf="nv ~/.config/kitty/kitty.conf"
alias nvconfig="cd ~/.config/nvim && nv"
alias binds="nv ~/.config/keybindings.json"
alias dots="cd ~/.dotfiles/ && nv"
alias vault="cd ~/Documents/secondBrain/ && nv"
alias py="python3.10"
alias nv="nvim"
alias venv_create="py -m venv venv"
alias venv_activate="source ./venv/bin/activate"
alias list_avd_devices="ls /home/khalil/.android/avd"
alias launch_avd_device='/home/khalil/Android/Sdk/emulator/emulator -avd Pixel_XL_API_31 -writable-system '
alias androidStudio="/home/khalil/android-studio/bin/studio.sh"
alias blockify="LD_PRELOAD=/usr/local/lib/spotify-adblock.so spotify"
alias ls="eza --color=always --git "
alias bat="batcat"
alias csv_to_json="jq -Rsn '(input | split(\"\n\") | .[1:] | map(select(length > 0) | split(\",\") | {url: .[0], path: .[1], params: null}))' > paths.json"
# alias shub_deploy="shub image upload $SHUB_DEVZONE --build-arg PYPI_SECRET=$PYPI_SECRET"
