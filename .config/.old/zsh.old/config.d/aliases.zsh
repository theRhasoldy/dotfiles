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

alias update-android="paru -Syu android-emulator android-google-apis android-platform android-sdk android-sdk-build-tools android-google-apis-x86-64-system-image"

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
alias man="batman"
alias diff="batdiff"
alias find="fd"
alias grep="rg"

alias rg="rg --sort path"

#Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

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

#Recently installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

#Pacman
alias pacclean='sudo paru -Rns $(paru -Qtdq)'

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

