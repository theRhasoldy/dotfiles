#ls --> exa
alias exa "exa --color=auto --icons"

alias ls "exa -x"
alias lsa "ls -a"

alias ll "exa -l@m --no-permissions --git"
alias lla "ll -a"

alias llt "ll -T"

#../.. --> ...
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."
alias ...... "cd ../../../../.."

alias rm "rm -vI"
alias cp "rsync -ahv --info=progress2"
alias mv "mv -vi"

alias grep "grep --color=auto"

alias vim "nvim"
alias vi "nvim"
alias nano "nvim"

alias pacman "sudo pacman"

alias suspend "systemctl suspend"

alias matrix "unimatrix -c magenta -s 96 -a -l s"

alias update-android "paru -Syu android-emulator android-google-apis android-ndk android-platform android-sdk android-sdk-build-tools android-google-apis-x86-64-system-image"

alias git-token 'echo "$(cat $HOME/Documents/protected/tokens.md)" | xclip -selection clipboard && echo "Git token copied to clipboard :)"'

alias dotfiles "/usr/bin/git --git-dir=$HOME/.config/dotfiles/ --work-tree=$HOME"
