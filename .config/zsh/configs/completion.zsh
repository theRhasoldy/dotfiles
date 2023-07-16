#!/usr/bin/env zsh
autoload -Uz compinit

if [[ "$(date '+%j')" != "$(/usr/bin/stat -c '%Y' ${XDG_CACHE_HOME}/zsh/.zcompdump)" ]]; then
  compinit -d ${XDG_CACHE_HOME}/zsh/.zcompdump
else
  compinit -C -d ${XDG_CACHE_HOME}/zsh/.zcompdump
fi

_comp_options+=(globdots)
