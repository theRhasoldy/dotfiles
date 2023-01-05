# Execute code only if STDERR is bound to a TTY.
if [[ -o INTERACTIVE && -t 2 ]]; then

	eval "$(starship init zsh)"
	bfetch
	xset r rate 200 40

fi >&2
