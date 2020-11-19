export PATH=$PATH:~/bin

export TERM=xterm-256color

# Vim as the default editor
export EDITOR=vim

# bat can be used as a colorizing pager for man
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Set Vim mode
set -o vi

# Test if ~/.aliases exists and source it
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
