export TERM=xterm-256color
export EDITOR=vim
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export PAGER=less
export BAT_THEME="gruvbox"
BAT_OPTS="--italic-text=always --color=always"

FD_OPTS="--hidden --follow --exclude .git --exclude node_modules"
export FZF_DEFAULT_OPTS="-m --height 50% --reverse --border --cycle --inline-info --header='C-e, ?, C-d, C-u, C-y' \
                        --bind='ctrl-e:execute(echo {+} | xargs -o $EDITOR)+abort,?:toggle-preview,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-a:select-all,ctrl-y:execute-silent(echo {+} | xclip -selection clipboard)' \
                        --preview='([[ -f {} ]] && (bat -n $BAT_OPTS {} || cat {})) || ([[ -d {} ]] && (tree -a -C {} | less)) || echo {} 2> /dev/null | head -200'"
export FZF_DEFAULT_COMMAND="fd --type f $FD_OPTS"
export FZF_CTRL_T_COMMAND="fd $FD_OPTS"
export FZF_CTRL_R_OPTS="--preview-window down:3:wrap"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTS"

source /usr/share/fzf/completion.bash
source /usr/share/fzf/key-bindings.bash

# Set Vim mode
set -o vi

bind "'\C-p':'fzf\n'"

# Tests if `~/.aliases` exists and sources it
# if [ -f ~/.aliases ]; then
#     source ~/.aliases
# fi

alias live-server="browser-sync start --server --files . --no-notify --port 5500"
alias stow="stow -v"
alias bat="bat $BAT_OPTS"
alias sobash="source ~/.bashrc"
alias rg="rg --column --smart-case --follow --hidden -p -g '!.git/*' -g '!node_modules/*'"
alias xcopy='xclip -selection clipboard'
alias xpaste='xclip -selection clipboard -o'

# stow (th stands for 'target=home')
# stowth() {
#   stow -vt ~ $1
# }

# unstowth() {
#   stow -vDt ~ $1
# }

# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
