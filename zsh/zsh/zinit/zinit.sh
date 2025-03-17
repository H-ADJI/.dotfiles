# zinit installation
# shellcheck disable=all
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d "$ZINIT_HOME" ] && mkdir -p "$(dirname "$ZINIT_HOME")"
[ ! -d "$ZINIT_HOME"/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# plugins
# source ~/zsh/zinit/options/zoxide.zsh
source ~/zsh/zinit/plugins.sh
source ~/zsh/zinit/snippets.sh
