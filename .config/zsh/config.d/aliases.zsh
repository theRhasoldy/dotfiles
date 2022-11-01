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

alias rm="rm -v"

alias %=""

alias dotfiles="/usr/bin/git --git-dir=$HOME/.config/dotfiles/ --work-tree=$HOME"

alias pacman="sudo pacman"

alias suspend="systemctl suspend"

alias matrix="unimatrix -c magenta -s 96 -a -l s"

alias wiki="cd ~/Universe && nvim -c VimwikiIndex"

alias update-android="paru -Syu android-emulator android-google-apis android-ndk android-platform android-sdk android-sdk-build-tools android-google-apis-x86-64-system-image"

alias git-token='echo "$(cat $HOME/Documents/protected/tokens.md)" | xclip -selection clipboard && echo "Git token copied to clipboard :)"'

alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
