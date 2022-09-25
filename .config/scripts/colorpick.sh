Hello=$(colorpicker --one-shot --short --preview)
echo $Hello | xclip -selection clipboard
notify-send --icon /usr/share/icons/Delight-gray/scalable/apps/colors.svg "Colorpicker" $Hello
exit 0 
