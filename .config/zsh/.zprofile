# XDG {{{
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache
#}}}

# export TERM="kitty"
export BROWSER="vivaldi-snapshot"

export EDITOR="nvim"
export VISUAL="nvim"

export VIMCONFIG="$XDG_CONFIG_HOME/nvim"

export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_TYPE=en_US.UTF-8

# Pager {{{
export PAGER="less"
# }}}

export PUB_CACHE=$XDG_CACHE_HOME/flutter/pub
export DART_SDK=$XDG_DATA_HOME/dev/dart/sdk

export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

export GRADLE_USER_HOME=$XDG_DATA_HOME/gradle 

export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export CARGO_HOME=$XDG_DATA_HOME/cargo

export GOPATH=$XDG_DATA_HOME/go

export GEM_HOME=$XDG_DATA_HOME/gem/


export PATH="$PATH:$XDG_DATA_HOME/gem/ruby/3.0.0/bin"
export PATH="$PATH":"$XDG_CACHE_HOME/flutter/pub/bin"

export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc
export GNUPGHOME=$XDG_DATA_HOME/gnupg/

export MPLAYER_HOME="$XDG_CONFIG_HOME"/mplayer 
export WINEPREFIX=$XDG_DATA_HOME/wine

export BFETCH_CLASSIC_MODE=true

# Exa {{{
export LS_COLORS="di=35"
export EXA_COLORS="da=30"
#}}}

export PATH=$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
