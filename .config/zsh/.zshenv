export TERMINAL="kitty"
export EDITOR=nvim

# XDG {{{
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config/
export XDG_STATE_HOME=$HOME/.local/state/
export XDG_CACHE_HOME=$HOME/.cache/
#}}}

export CARGO_HOME=$XDG_DATA_HOME/cargo
export GNUPGHOME=$HOME_DATA_HOME/gnupg
export LESSHISTFILE=$XDG_CACHE_HOME/history
export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc

# export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
# export XRESOURCES="$XDG_CONFIG_HOME"/X11/Xresources
# export XCURSOR_PATH=/usr/share/icons:${XDG_DATA_HOME}/icons

export GRADLE_USER_HOME=$XDG_DATA_HOME/dev/gradle 

export PUB_CACHE=$XDG_CACHE_HOME/flutter/pub
export DART_SDK=$XDG_DATA_HOME/dev/dart/sdk

export ZK_NOTEBOOK_DIR=$HOME/Mind

export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc

# Bfetch {{{
export BFETCH_CLASSIC_MODE=true
#}}}

# Android {{{
export ANDROID_SDK_ROOT=$XDG_DATA_HOME/dev/
export ANDROID_SDK_HOME=$XDG_DATA_HOME/dev/
export ANDROID_AVD_HOME=$XDG_DATA_HOME/dev/avd
#}}}
