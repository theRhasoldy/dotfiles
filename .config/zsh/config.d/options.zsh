setopt autocd extendedglob nomatch 

export LC_CTYPE=en_US.UTF-8

# unsetopt beep notify 

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

setopt INTERACTIVE_COMMENTS

# Remove mode switching delay.
KEYTIMEOUT=1

bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^j' vi-down-line-or-history
bindkey -M menuselect '^[' send-break

eval "$(starship init zsh)"

