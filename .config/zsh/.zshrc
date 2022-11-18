# Default Enviroment Variables {{{
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache
# }}}

source /usr/share/zsh/plugins/zsh-lazyload/zsh-lazyload.zsh

# Load seperated config files 
for conf in "$HOME/.config/zsh/config.d/"*.zsh; do
  source "${conf}"
done
unset conf

setxkbmap -option caps:swapescape
bfetch
