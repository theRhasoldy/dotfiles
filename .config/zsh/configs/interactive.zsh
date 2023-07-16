# Execute code that does not affect the current session in the background.
{
  # Compile the completion dump to increase startup speed.
  zcompdump="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
  zcompile ${ZDOTDIR:-${HOME}}/.zshrc
  zcompile ${ZDOTDIR:-${HOME}}/.zprofile
  zcompile ${ZDOTDIR:-${HOME}}/.zshenv
} &!

# Execute code only if in interactive session
if [[ -o INTERACTIVE && -t 2 ]]; then
	eval "$(starship init zsh)"
  eval "$(zoxide init zsh)"
fi >&2
