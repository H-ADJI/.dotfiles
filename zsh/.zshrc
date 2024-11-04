# zmodload zsh/zprof
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
zstyle ':omz:update' mode auto      # update automatically without asking
# You can also set it to another string to have that shown instead of the default red dots.
COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"
plugins=(git direnv nvm)
zstyle ':omz:plugins:nvm' lazy yes
source $ZSH/oh-my-zsh.sh
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
# PATH
PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/nvim/bin:$PATH"
PATH=$PATH:/usr/local/go/bin
PATH=$PATH:~/apps
PATH=$PATH:~/go/bin
# aliases
alias zshconfig="nv ~/.zshrc"
alias py="python3.10"
alias nv="nvim"
alias venv_create="py -m venv venv"
alias venv_activate="source ./venv/bin/activate"
alias notebook="jupyter notebook"
alias shub_deploy="shub image upload $SHUB_DEVZONE --build-arg PYPI_SECRET=$PYPI_SECRET"
alias see_yaa="sudo rtcwake -m off -t $(date -d 'tomorrow 07:00:00' +%s)"
alias connect_speaker="echo 'connect 10:94:97:36:C7:15' | bluetoothctl"
alias disconnect_bluetooth="echo 'disconnect' | bluetoothctl"
alias cpc="xclip -sel c"
alias list_devices="ls /home/khalil/.android/avd"
alias launch_device='/home/khalil/Android/Sdk/emulator/emulator -avd Pixel_XL_API_31 -writable-system '
alias androidStudio="/home/khalil/android-studio/bin/studio.sh"
# safe gards to not break gloabal python installation
function cd() {
    builtin cd "$@"  # Call the built-in cd command
    if [ -f "./venv/bin/activate" ]; then
        source ./venv/bin/activate
    fi
}
# function pip() {
#     if [ ! -z  "$VIRTUAL_ENV" ]; then
#         echo "Activated venv in $(pwd)"
#         pip "$@"  # Call the built-in cd command
#     else 
#         echo "Danger ⚠️ venv Not Activated"
#     fi
# }
export DIRENV_LOG_FORMAT=""
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fdfind --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fdfind --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fdfind --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fdfind --type=d --hidden --exclude .git . "$1"
}
# include fzf-git script 
source ~/.fzf-git.sh

export BAT_THEME="Visual Studio Dark+"

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}
alias ls="eza --color=always --git --no-filesize --icons=always --no-time --no-user --no-permissions"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# for scrapy fuzzy search
scrapy_fzf_insert() {
    # Run FZF with a custom appearance
    local spider=$(scrapy list 2>/dev/null | fzf \
        --height 40% \
        --layout=reverse \
        --border \
        # --color=border:brightblack,gutter:-1,prompt:brightcyan,spinner:green,hl:yellow,fg:default,fg+:white,bg+:24,hl+:yellow \
        --prompt="Select Spider: " \
        --pointer="▶ " \
        --marker="✔ " \
        --preview="echo 'Spider: {}'" \
        --preview-window=down:1:wrap)

    # Insert the selected spider name into the command line
    if [ -n "$spider" ]; then
        LBUFFER="${LBUFFER}${spider} "
    fi
    zle redisplay
}

# Define the widget and bind it to Ctrl+g
zle -N scrapy_fzf_insert
bindkey '^g' scrapy_fzf_insert
# loading zsh custom completions 
fpath=(~/.zsh/completions $fpath)
autoload -Uz compinit
compinit
# zprof
