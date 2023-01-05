#!/usr/bin/env bash
xremap $HOME/.config/xremap.yml &

run_once () {
	if ! pgrep -x "$1" > /dev/null
	then
			$1 $2 &
	fi
}

run_once "xbanish" " -t 10"
run_once "greenclip" "daemon"
run_once "lxsession" ""

run_once "bash /home/rhasoldy/.config/scripts/notif_log.sh /home/rhasoldy/.cache/notif_log.txt" ""

picom --experimental-backends &
feh --bg-fill --no-fehbg /usr/share/backgrounds/background.jpg &