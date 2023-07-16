PLUGINS="/usr/share/zsh/plugins"

source $PLUGINS/zsh-vi-mode/zsh-vi-mode.zsh
source $PLUGINS/zsh-you-should-use/you-should-use.plugin.zsh
source $PLUGINS/zsh-autopair/autopair.zsh

source $PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=9,bold"
ZSH_HIGHLIGHT_STYLES[command]="fg=10"
ZSH_HIGHLIGHT_STYLES[reserved-word]="fg=12"
ZSH_HIGHLIGHT_STYLES[alias]="fg=6"
ZSH_HIGHLIGHT_STYLES[builtin]="fg=12"
ZSH_HIGHLIGHT_STYLES[path]="fg=13"
ZSH_HIGHLIGHT_STYLES[autodirectory]="fg=13"
ZSH_HIGHLIGHT_STYLES[line]='bg=6'

source $PLUGINS/zsh-system-clipboard/zsh-system-clipboard.zsh
ZSH_SYSTEM_CLIPBOARD_METHOD="xsc"
