#!/usr/bin/env bash

#
# Powermenu made with Rofi
#
# https://github.com/lu0
#

show_usage() {
  echo -e "\nTrigger a blurry powermenu made with rofi."
  echo -e "\nUSAGE:"
  echo -e "   blurry-powermenu [OPTIONS]"
  echo -e "\nOPTIONS:"
  echo -e "       -h | --help     Show this manual.\n"
  echo -e "       -p | --poweroff   Highlight 'poweroff' option."
  echo -e "       -r | --reboot     Highlight 'reboot' option."
  echo -e "       -s | --sleep      Highlight 'sleep' option."
  echo -e "       -l | --logout     Highlight 'logout' option."
  echo -e "       -k | --lock       Highlight 'lock' option (default).\n"
}

# Options as unicode characters of
# the custom-compiled version of Feather icons
poweroff=$(echo -ne "⏻");
reboot=$(echo -ne "ﯩ");
sleep=$(echo -ne "󰤄");
logout=$(echo -ne "󰍃");
lock=$(echo -ne "");
options="$poweroff\n$reboot\n$sleep\n$logout\n$lock"

# Parse CLI selection, defaults to logout
preselection=4
while getopts prslkh-: OPT; do
  [ "${OPT}" = "-" ] && OPT=${OPTARG}
  case "$OPT" in
    p | poweroff)   preselection=0 ;;
    r | reboot)     preselection=1 ;;
    s | sleep)      preselection=2 ;;
    l | logout)     preselection=3 ;;
    k | lock)       preselection=4 ;;
    *) show_usage; exit 1 ;;
  esac
done

# Compute font size based on display dimensions
default_width=1920
default_font_size=60
fontsize=60

selected="$(echo -e "$options" |
  rofi -config ~/.config/rofi/powermenu.rasi\
  -font "Ubuntu, $fontsize" \
  -p "See you later, ${USER^}!" -dmenu -selected-row ${preselection})"

case $selected in
  "${poweroff}")
    systemctl poweroff
    ;;
  "${reboot}")
    systemctl reboot
    ;;
  "${sleep}")
    systemctl suspend
    ;;
  "${logout}")
    pkill awesome
    ;;
  "${lock}")
    cinnamon-screensaver-command --lock || ( xflock4 || mate-screensaver-command -l )
    ;;
esac
