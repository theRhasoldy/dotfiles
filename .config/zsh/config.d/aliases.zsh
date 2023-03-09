#ls --> exa
alias ls="exa --icons --group-directories-first"
alias lsa="ls -a"
alias ll="ls -l@ --git --time=accessed --no-permissions"
alias lla="ll -a"
alias llt="lla -T"

#../.. --> ...
alias ...="../.."
alias ....="../../.."
alias .....="../../../.."
alias ......="../../../../.."

alias pacman="sudo pacman"

alias matrix="unimatrix -c magenta -s 96 -a -l s"

alias update-android="paru -Syu android-emulator android-google-apis android-ndk android-platform android-sdk android-sdk-build-tools android-google-apis-x86-64-system-image"

alias git-token="bash $HOME/Documents/protected/gittoken.sh"

alias rm="rm -vI"
alias cp="rsync -ahv --info=progress2"
alias mv="mv -vi"

# Nvim 
alias vim="nvim"
alias vi="nvim"
alias nano="nvim"

# Legacy
alias cat="bat"
alias find="fd"
alias sed="sd"

# Git
alias g="git"
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gd="git diff"
alias gbc="git checkout"
alias gpl="git pull"
alias gps="git push"

# Dotfiles
alias dot="/usr/bin/git --git-dir=$HOME/.config/dotfiles/ --work-tree=$HOME"
alias dots="dot status"
alias dota="dot add"
alias dotc="dot commit -m"
alias dotd="dot diff"
alias dotps="dot push"

# zoxide with tmux
export PATH=$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
