set fish_greeting ""
# setxkbmap -option caps:swapescape
xset r rate 200 40

# Set the cursor shapes for the different vi modes.
set fish_cursor_default block blink
set fish_cursor_insert line blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual block

if status --is-interactive
	eval "$(starship init fish)"
	bfetch
end
