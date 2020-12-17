# +----------------------+
# | Enviroment Variables |
# +----------------------+
# XDG Base Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.cache"
export XDG_CACHE_HOME="$HOME/.local/share"

# Default programs
export TERM=xterm-256color
export EDITOR="vim"
export VISUAL="vim"
export PAGER="less"
# Uses `bat` to colorize man pages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Purple group coloring in long list for 'exa'
export EXA_COLORS="gu=35;1"

# `bat` defaults
export BAT_THEME="gruvbox"
BAT_OPTS="--italic-text=always --color=always"

# `fd` defaults
FD_OPTS="--hidden --follow --exclude .git --exclude node_modules"

# `fzf` defaults
FZF_OPTS="-m --height 50% --reverse --border --cycle --inline-info --header='C-e, ?, C-d, C-u, C-y'"
FZF_BIND="--bind='ctrl-e:execute(echo {+} | xargs -o $EDITOR)+abort,?:toggle-preview,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-a:select-all,ctrl-y:execute-silent(echo {+} | xclip -selection clipboard)'"
FZF_PREVIEW="--preview='([[ -f {} ]] && (bat -n $BAT_OPTS {} || cat {})) || \
                        ([[ -d {} ]] && (tree -aC {} | less)) || \
                        echo {} 2> /dev/null | head -200'"
export FZF_DEFAULT_OPTS="$FZF_OPTS $FZF_BIND $FZF_PREVIEW"
export FZF_DEFAULT_COMMAND="fd --type f $FD_OPTS"
export FZF_CTRL_T_COMMAND="fd $FD_OPTS"
export FZF_CTRL_R_OPTS="--preview-window down:3:wrap"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTS"

# +---------+
# | Aliases |
# +---------+
# Load aliases and shortcuts if existent.
# [ -f "$HOME/.aliases" ] && source "$HOME/.aliases"

# Overwrite existing commands for better defaults
alias mv="mv -vi"
alias mkdir="mkdir -vp"
alias df="df -h"
alias cp="cp -vi"
alias rm="rm -vI"
alias free="free -h"
alias ss="sudo ss -plunt" # To show the PID and name of some processes this command must be run with sudo


# Aliases for "third party" programs
alias ll="exa -lagh --icons --color=auto --group-directories-first"
alias ls="exa -a --icons --color=auto --group-directories-first"
alias stow="stow -v"
alias bat="bat $BAT_OPTS"
alias fd="fd $FD_OPTS"
alias rg="rg --column --smart-case --follow --hidden -p -g '!.git/*' -g '!node_modules/*'"
alias live-server="browser-sync start --server --files . --no-notify --port 5500"
alias sozsh="source ~/.zshrc"
alias xcopy='xclip -selection clipboard'
alias xpaste='xclip -selection clipboard -o'

# +----+
# | UI |
# +----+
# Enable colors and change prompt
autoload -U colors && colors

# Allow for variable/function substitution in prompt
setopt prompt_subst

# Prompt format
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# +---------------------+
# | Basic Configuration |
# +---------------------+
# History defaults
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.zsh_history
setopt inc_append_history
setopt extended_history

# Enable interactive comments (# on the command line)
setopt interactivecomments

# Basic auto/tab complete
autoload -Uz compinit
zstyle ':completion:*' menu select

# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zmodload zsh/complist
compinit

# Include hidden files.
_comp_options+=(globdots)

# vi mode
bindkey -v
KEYTIMEOUT=1 # Recommended time to wait for additional characters in a sequence (1 = 10ms)

# +-------------+
# | Keybindings |
# +-------------+
bindkey -s "\C-p" "fzf\n"

# Edit line in vim buffer 'ctrl-e'
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd "^e" edit-command-line # Enter vim buffer also from normal mode

# Use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey "^?" backward-delete-char # Fix backspace bug when switching modes

# Edit inside quotes (like 'ci"')
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
    for c in {a,i}{\',\",\`}; do
        bindkey -M $m $c select-quoted
    done
done

# Edit inside brackets (like 'ci[')
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
    for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
        bindkey -M $m $c select-bracketed
    done
done

# fzf acts like a selector interface for ripgrep rather than a 'fuzzy finder'
# TODO: make a better previewer for ripgrep like the one used in fzf.vim
RipgrepFzf () {
    INITIAL_QUERY=""
    RG_PREFIX="rg --follow --column --line-number --no-heading --color=always --smart-case --hidden -g '!.git/*' -g '!node_modules/*'"
    FZF_DEFAULT_COMMAND="$RG_PREFIX '$INITIAL_QUERY'" \
        fzf --bind "change:reload:$RG_PREFIX {q} || true" \
        --ansi --phony --query "$INITIAL_QUERY" \
        -m --height 50% --reverse --border --cycle --inline-info --no-header \
        --preview="/home/iran/dotfiles/vim/.vim/plugged/fzf.vim/bin/preview.sh {}"
}

bindkey -s "\C-g" "RipgrepFzf\n"

# openWithFzf() {
#     fd -t f -H -I | fzf -m --preview="xdg-mime query default {}" | xargs -ro -d "\n" xdg-open 2>&-
# }

# bindkey -s "\C-f" "openWithFzf\n"

# pacs() {
#     sudo pacman -Syy $(pacman -Ssq | fzf -m --preview="pacman -Si {}" --preview-window=:hidden --bind=space:toggle-preview)
# }

# ex - archive extractor
# Usage: ex <file>
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

# Prints cointainers in a formated way (it's a workaround cuz aliases can't
# have spaces in between)
docker() {
    if [[ $@ == "ps" ]]; then
        command docker ps --format="ID\t{{.ID}}\nNAME\t{{.Names}}\nIMAGE\t{{.Image}}\nPORTS\t{{.Ports}}\nCOMMAND\t{{.Command}}\nCREATED\t{{.CreatedAt}}\nSTATUS\t{{.Status}}\n"
    elif [[ $@ == "ps -a" ]]; then
        command docker ps -a --format="ID\t{{.ID}}\nNAME\t{{.Names}}\nIMAGE\t{{.Image}}\nPORTS\t{{.Ports}}\nCOMMAND\t{{.Command}}\nCREATED\t{{.CreatedAt}}\nSTATUS\t{{.Status}}\n"
    else
        command docker $@
    fi
}

# stow (th stands for 'target=home')
# stowth() {
#   stow -vt ~ $1
# }

# unstowth() {
#   stow -vDt ~ $1
# }

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

# +---------+
# | Plugins |
# +---------+
# Post sourcing for `fzf`
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

# Plugins added to 'zsh path'
fpath=($HOME/.zsh/plugins $fpath)

# Loads completions from 'zsh-completions' plugin
fpath=($HOME/.zsh/plugins/zsh-completions/src $fpath)

# Change cursor shape for different vi modes. (doesn't work well within tmux. When vim is opened the cursor stands as `|`)
# autoload -Uz cursor_mode; cursor_mode

# Agnoster theme to the prompt
source ~/dotfiles/zsh/.zsh/themes/agnoster-zsh-theme/agnoster.zsh-theme 2>/dev/null

# Search repos for programs that can't be found (if it doesn't work properly execute `pkgfile --update` and try again)
source /usr/share/doc/pkgfile/command-not-found.zsh 2>/dev/null

# Suggest aliases for commands
source ~/dotfiles/zsh/.zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh 2>/dev/null

# `fish` like autosuggestions
source ~/dotfiles/zsh/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
bindkey '^ ' autosuggest-accept

# Load zsh-syntax-highlighting (should be last)
source ~/dotfiles/zsh/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
