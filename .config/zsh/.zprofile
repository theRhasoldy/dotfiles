export TERMINAL="kitty"
export BROWSER="vivaldi-snapshot"

export EDITOR="nvim"
export VISUAL="nvim"

export VIMCONFIG="$XDG_CONFIG_HOME/nvim"

export LC_CTYPE=en_US.UTF-8

# export XRESOURCES="$XDG_CONFIG_HOME"/X11/Xresources
export XAUTHORITY=$XDG_CONFIG_HOME/X11/Xauthority
export XINITRC=$XDG_CONFIG_HOME/X11/xinitrc

# less {{{
export PAGER="less"
export LESSHISTFILE=$XDG_CACHE_HOME/history
# }}}


# XDG {{{
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache
#}}}

# Dev {{{
export ANDROID_SDK_ROOT=$XDG_DATA_HOME/dev/
export ANDROID_SDK_HOME=$XDG_DATA_HOME/dev/
export ANDROID_AVD_HOME=$XDG_DATA_HOME/dev/avd
export PUB_CACHE=$XDG_CACHE_HOME/flutter/pub
export DART_SDK=$XDG_DATA_HOME/dev/dart/sdk
export GRADLE_USER_HOME=$XDG_DATA_HOME/dev/gradle 
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export CARGO_HOME=$XDG_DATA_HOME/cargo
export GOPATH=$XDG_DATA_HOME/go
export GEM_HOME=$XDG_DATA_HOME/gem/
export PATH="$PATH:$XDG_DATA_HOME/gem/ruby/3.0.0/bin"
#}}}

export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc
export GNUPGHOME=$XDG_DATA_HOME/gnupg/
export BFETCH_CLASSIC_MODE=true

export MPLAYER_HOME="$XDG_CONFIG_HOME"/mplayer 
export WINEPREFIX=$XDG_DATA_HOME/wine

export _Z_DATA="$XDG_DATA_HOME/z"
