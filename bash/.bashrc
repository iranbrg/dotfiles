export TERM=xterm-256color

# Vim as the default editor
export EDITOR=vim

# `bat` can be used as a colorizing pager for man
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Sets `less` as the main pager
export PAGER=less

# Set Vim mode
set -o vi

# Tests if `~/.aliases` exists and sources it
# if [ -f ~/.aliases ]; then
#     source ~/.aliases
# fi

# Alias to start the browser-sync server
alias live-server="browser-sync start --server --files . --no-notify --port 5500"

alias stow="stow -v"

# stow (th stands for 'target=home')
# stowth() {
#   stow -vt ~ $1
# }

# unstowth() {
#   stow -vDt ~ $1
# }
