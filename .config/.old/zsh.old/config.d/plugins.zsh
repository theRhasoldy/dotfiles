# Better vi deez nuts
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.zsh

# Syntax highlighting {{{
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=9,bold"
ZSH_HIGHLIGHT_STYLES[command]="fg=10"
ZSH_HIGHLIGHT_STYLES[reserved-word]="fg=12"
ZSH_HIGHLIGHT_STYLES[alias]="fg=6"
ZSH_HIGHLIGHT_STYLES[builtin]="fg=12"
ZSH_HIGHLIGHT_STYLES[path]="fg=13"
ZSH_HIGHLIGHT_STYLES[autodirectory]="fg=13"
ZSH_HIGHLIGHT_STYLES[line]='bg=6'
# }}}

source /usr/share/zsh/plugins/zsh-autopair/autopair.zsh

source /usr/share/zsh/plugins/zsh-sudo/sudo.plugin.zsh
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh

# Auto Suggestions {{{
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#595959,underline"
# }}}

source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

source /usr/share/zsh/plugins/zsh-system-clipboard/zsh-system-clipboard.zsh
ZSH_SYSTEM_CLIPBOARD_METHOD="xcc"
