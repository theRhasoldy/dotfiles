#!/usr/bin/env zsh
autoload -Uz compinit

if [[ "$(date '+%j')" != "$(/usr/bin/stat -c '%Y' ${ZDOTDIR:-$HOME}/.zcompdump)" ]]; then
  compinit
else
  compinit -C
fi

_comp_options+=(globdots)
