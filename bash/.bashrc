export TERM=xterm-256color
export EDITOR=vim
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export PAGER=less

FD_OPTS="--hidden --follow --exclude .git --exclude node_modules"
export FZF_DEFAULT_OPTS="-m --height 50% --reverse --border --cycle --inline-info \
                        --bind='ctrl-v:execute($EDITOR {})+abort,ctrl-p:toggle-preview,ctrl-d:half-page-down,ctrl-u:half-page-up,alt-a:select-all' \
                        --preview='[[ \$(file {}) =~ directory ]] && tree -a -C {} || \
                        (bat -n --italic-text=always --color=always --theme='gruvbox' {} || \
                        cat {}) 2>/dev/null | head -300'"
export FZF_DEFAULT_COMMAND="fd --type f $FD_OPTS"
export FZF_CTRL_T_COMMAND="fd $FD_OPTS"
export FZF_CTRL_R_OPTS="--preview-window hidden"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTS"

source /usr/share/fzf/completion.bash
source /usr/share/fzf/key-bindings.bash

# Set Vim mode
set -o vi

# Tests if `~/.aliases` exists and sources it
# if [ -f ~/.aliases ]; then
#     source ~/.aliases
# fi

# Alias to start the browser-sync server
alias live-server="browser-sync start --server --files . --no-notify --port 5500"

alias stow="stow -v"

alias bat="bat --italic-text=always --color=always --theme='gruvbox'"

alias sobash="source ~/.bashrc"

# stow (th stands for 'target=home')
# stowth() {
#   stow -vt ~ $1
# }

# unstowth() {
#   stow -vDt ~ $1
# }
