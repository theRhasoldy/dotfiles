# Execute code only if STDERR is bound to a TTY.
if [[ -o INTERACTIVE && -t 2 ]]; then

	eval "$(starship init zsh)"
	bfetch

fi >&2
