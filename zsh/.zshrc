# Set the shell to zsh
export SHELL=/bin/zsh

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

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

bindkey -s "^p" "fzf\n"

alias live-server="browser-sync start --server --files . --no-notify --port 5500"
alias stow="stow -v"
alias bat="bat $BAT_OPTS"
alias fd="fd $FD_OPTS"
alias sozsh="source ~/.zshrc"
alias rg="rg --column --smart-case --follow --hidden -p -g '!.git/*' -g '!node_modules/*'"
alias xcopy='xclip -selection clipboard'
alias xpaste='xclip -selection clipboard -o'
alias ll="ls -lhAp --color=auto"
alias ls="ls -Ap --color=auto --group-directories-first"
alias mv="mv -vi"           # -i prompts before overwrite
alias mkdir="mkdir -vp"     # -p make parent dirs as needed
alias df="df -h"           # -h prints human readable format
alias cp="cp -vi"                          # confirm before overwriting something
alias rm="rm -vI"
alias free='free -h'                      # show sizes in MB

# # ex - archive extractor
# # usage: ex <file>
ex ()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1   ;;
            *.tar.gz)    tar xzf $1   ;;
            *.bz2)       bunzip2 $1   ;;
            *.rar)       unrar x $1   ;;
            *.gz)        gunzip $1    ;;
            *.tar)       tar xf $1    ;;
            *.tbz2)      tar xjf $1   ;;
            *.tgz)       tar xzf $1   ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1;;
            *.7z)        7z x $1      ;;
            *)           echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# stow (th stands for 'target=home')
# stowth() {
#   stow -vt ~ $1
# }

# unstowth() {
#   stow -vDt ~ $1
# }

# Enable colors and change prompt:
autoload -U colors && colors
# Allow for variable/function substitution in prompt
setopt prompt_subst
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.cache/zsh/history
# setopt appendhistory
# setopt incappendhistory
# setopt extendedhistory

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
# Time to wait for additional characters in a sequence
KEYTIMEOUT=1 # corresponds to 10ms

# Edit line in vim buffer ctrl-v
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
# Enter vim buffer from normal mode
autoload -U edit-command-line && zle -N edit-command-line && bindkey -M vicmd "^e" edit-command-line

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
# Fix backspace bug when switching modes
bindkey "^?" backward-delete-char

# Change cursor shape for different vi modes. (doesn't work well within tmux when vim is open the cursor stands as `|`)
# function zle-keymap-select {
#   if [[ ${KEYMAP} == vicmd ]] ||
#      [[ $1 = 'block' ]]; then
#     echo -ne '\e[1 q'
#   elif [[ ${KEYMAP} == main ]] ||
#        [[ ${KEYMAP} == viins ]] ||
#        [[ ${KEYMAP} = '' ]] ||
#        [[ $1 = 'beam' ]]; then
#     echo -ne '\e[5 q'
#   fi
# }
# zle -N zle-keymap-select
# zle-line-init() {
#     zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#     echo -ne "\e[5 q"
# }
# zle -N zle-line-init
# echo -ne '\e[5 q' # Use beam shape cursor on startup.
# preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# ci", ci', ci`, di", etc
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done

# ci{, ci(, ci<, di{, etc
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done

# Enable interactive comments (# on the command line)
setopt interactivecomments

# Use lf to switch directories and bind it to ctrl-o
# lfcd () {
#     tmp="$(mktemp)"
#     lf -last-dir-path="$tmp" "$@"
#     if [ -f "$tmp" ]; then
#         dir="$(cat "$tmp")"
#         rm -f "$tmp"
#         [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
#     fi
# }
# bindkey -s '^o' 'lfcd\n'

# Load aliases and shortcuts if existent.
# [ -f "$HOME/.aliases" ] && source "$HOME/.aliases"

source ./.zsh/agnoster-zsh-theme/agnoster.zsh-theme 2>/dev/null

# Search repos for programs that can't be found (if it doesn't work properly execute `pkgfile --update` and try again)
source /usr/share/doc/pkgfile/command-not-found.zsh 2>/dev/null

# Suggest aliases for commands
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh 2>/dev/null

# `fish` like autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
bindkey '^ ' autosuggest-accept

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
