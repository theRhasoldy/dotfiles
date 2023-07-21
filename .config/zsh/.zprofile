if [ -z "$XDG_CONFIG_HOME" ] ; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi
if [ -z "$XDG_DATA_HOME" ] ; then
    export XDG_DATA_HOME="$HOME/.local/share"
fi
if [ -z "$XDG_CACHE_HOME" ] ; then
    export XDG_CACHE_HOME="$HOME/.cache"
fi
if [ -z "$XDG_STATE_HOME" ] ; then
    export XDG_STATE_HOME="$HOME/.local/state"
fi

if [[ -z "$LANG" ]]; then
    export LANG='en_US.UTF-8'
    export LANGUAGE=en_US.UTF-8
fi

# Defaults
export BROWSER=vivaldi-stable

export EDITOR=nvim
export VISUAL=nvim

export PAGER="less"
export QT_STYLE_OVERRIDE=kvantum

# Locales
export LC_COLLATE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LESSCHARSET=utf-8

# Env
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

# Eliminates duplicates in *paths
typeset -gU cdpath fpath path

# Zsh search path for executable
path=(
  /usr/local/{bin,sbin}
  $path
)

# t
export PATH=$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
