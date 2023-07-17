# History
HISTFILE="${XDG_CACHE_HOME}/zsh/.histfile"

HISTSIZE=500000
SAVEHIST=500000

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
