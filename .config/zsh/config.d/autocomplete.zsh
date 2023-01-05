setopt LIST_PACKED
setopt AUTO_MENU
setopt COMPLETE_IN_WORD 

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*:*:git:*' script ~/.config/zsh/config.d/git-completion.bash

zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':autocomplete:*' widget-style menu-select

# Formatting
zstyle ':completion:*:*:*:*:descriptions' format '%F{cyan}-- %d --%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{red}!- %d (errors: %e) -!%f'
zstyle ':completion:*:messages' format ' %F{green} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{yellow}-- no matches found --%f'

# Group Descriptions
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order alias builtins functions commands

# Sorting and listing
zstyle ':autocomplete:*' fzf-completion yes
zstyle ':completion:*' file-sort access reverse
zstyle ':completion:*' file-list all

zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' complete-options true

# Caching autocomplete
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompdump"
zmodload zsh/complist
compinit
_comp_options+=(globdots)

bindkey -M menuselect '^[' send-break
bindkey -M menuselect '\n' accept-line
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect '/' history-incremental-search-forward #Freaking search my autocomplete whaat!
