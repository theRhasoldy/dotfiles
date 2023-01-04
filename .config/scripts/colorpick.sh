cmd=$(colorpicker --one-shot --short --preview)
echo $cmd | xclip -selection clipboard
notify-send --icon /usr/share/icons/Fluent-grey-dark/scalable/apps/color.svg -a "Colorpicker" "Hex-code" $cmd
exit 0 
