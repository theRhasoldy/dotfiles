# History
HISTFILE="${XDG_CACHE_HOME}/zsh/.histfile"

HISTSIZE=500000
SAVEHIST=500000

ZVM_TERM=xterm-kitty

setopt EXTENDED_HISTORY          
setopt SHARE_HISTORY             
setopt HIST_EXPIRE_DUPS_FIRST    
setopt HIST_IGNORE_DUPS          
setopt HIST_IGNORE_ALL_DUPS      
setopt HIST_FIND_NO_DUPS         
setopt HIST_IGNORE_SPACE         
setopt HIST_SAVE_NO_DUPS         
setopt HIST_VERIFY   

# cd
setopt auto_cd              # Auto changes to a directory without typing cd.
setopt auto_pushd           # Push the old directory onto the stack on cd.
setopt pushd_ignore_dups    # Do not store duplicates in the stack.
setopt pushd_silent         # Do not print the directory stack after pushd or popd.
setopt pushd_to_home        # Push to home directory when no argument is given.
setopt cdable_vars          # Change directory to a path stored in a variable.
setopt auto_name_dirs       # Auto add variable-stored paths to ~ list.
setopt extended_glob 

ZVM_KEYTIMEOUT=0
ZVM_ESCAPE_KEYTIMEOUT=0

#Change cursor shape for different vi modes.
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
