#!/usr/bin/env bash
mplayer -fs /usr/share/backgrounds/splash.mp4 &

run_once () {
	if ! pgrep -x "$1" > /dev/null
	then
			$1 $2 &
	fi
}

run_once "lxsession" ""
run_once "syncthing" ""
run_once "greenclip" "daemon"
run_once "setxkbmap" " -option caps:swapescape"
run_once "xset" " r rate 200 40"
run_once "xbanish" " -t 10"

picom --experimental-backends &
feh --bg-fill --no-fehbg /usr/share/backgrounds/background.jpg &
