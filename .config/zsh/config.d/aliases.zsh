#ls --> exa
alias ls="exa --icons -x"
alias lsa="ls -a"
alias ll="exa -l --icons"
alias lla="ll -a"
alias llt="exa -l -T --icons"

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

alias grep="grep --color=auto"

# Nvim 
alias vim="nvim"
alias vi="nvim"
alias nano="nvim"

# Dotfiles
alias dot="/usr/bin/git --git-dir=$HOME/.config/dotfiles/ --work-tree=$HOME"
alias dots="dot status"
alias dota="dot add"
alias dotc="dot commit -m"

