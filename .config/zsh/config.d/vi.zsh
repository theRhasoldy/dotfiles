bindkey -v
export KEYTIMEOUT=1

ZVM_KEYTIMEOUT=0
ZVM_ESCAPE_KEYTIMEOUT=0

# Change cursor shape for different vi modes.
cursor_block='\e[2 q'
cursor_beam='\e[6 q'

function zle-keymap-select {
RPS2=$RPS1
zle reset-prompt
if [[ ${KEYMAP} == vicmd ]] ||
  [[ $1 = 'block' ]]; then
  echo -ne $cursor_block
elif [[ ${KEYMAP} == main ]] ||
  [[ ${KEYMAP} == viins ]] ||
  [[ ${KEYMAP} = '' ]] ||
  [[ $1 = 'beam' ]]; then
  echo -ne $cursor_beam
fi
}

zle-line-init() {
RPS2=$RPS1
zle reset-prompt
echo -ne $cursor_beam
}

zle -N zle-keymap-select
zle -N zle-line-init
