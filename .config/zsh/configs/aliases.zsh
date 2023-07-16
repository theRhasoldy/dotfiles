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

# Convenient copy/remove/move
alias rm="rm -vI"
alias cp="rsync -ahv --info=progress2"
alias mv="mv -vi"

# Nvim 
alias vim="nvim"
alias vi="nvim"
alias nano="nvim" # Nano can suck deez nuts

alias rg="rg --sort path"

# Git
alias g="git"
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gpl="git pull"
alias gps="git push"

# Dotfiles
alias dot="/usr/bin/git --git-dir=$HOME/.config/dotfiles.git/ --work-tree=$HOME"
alias dots="dot status --untracked-files=no"
alias dota="dot add"
alias dotc="dot commit -m"
alias dotps="dot push"

# Clean Pacman
alias pacclean='sudo paru -Rns $(paru -Qtdq)'

# ex = EXtractor for all kinds of archives
# usage: ex <file>
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
