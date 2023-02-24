#!/usr/bin/env bash
mplayer -fs ~/Downloads/pexels-free-creative-stuff-6766163.mp4 &

run_once () {
	if ! pgrep -x "$1" > /dev/null
	then
			$1 $2 &
	fi
}

#xremap $HOME/.config/xremap.yml & #Breaks stuff
run_once "setxkbmap" " -option caps:swapescape"
run_once "xset" " r rate 200 40"
run_once "xbanish" " -t 10"
run_once "greenclip" "daemon"
run_once "lxsession" ""
run_once "syncthing" ""

picom --experimental-backends &
feh --bg-fill --no-fehbg /usr/share/backgrounds/background.jpg &

