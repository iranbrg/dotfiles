# Test if ~/.aliases exists and source it
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# Vim mode
bindkey -v

# Vim as the default editor
export EDITOR=vim
