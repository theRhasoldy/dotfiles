source ~/.config/zsh/plugins/alias-tips/alias-tips.plugin.zsh

source ~/.config/zsh/plugins/zsh-autopair/autopair.zsh

source ~/.config/zsh/plugins/zsh-lazyload/zsh-lazyload.zsh

source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#595959,underline"

source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=9,bold"
ZSH_HIGHLIGHT_STYLES[command]="fg=10"
ZSH_HIGHLIGHT_STYLES[reserved-word]="fg=12"
ZSH_HIGHLIGHT_STYLES[alias]="fg=12"
ZSH_HIGHLIGHT_STYLES[builtin]="fg=12"
ZSH_HIGHLIGHT_STYLES[path]="fg=11"
ZSH_HIGHLIGHT_STYLES[autodirectory]="fg=11"

