brightnessctl set 5%-
current=$(brightnessctl get)
max=$(brightnessctl max)
percent=$(( current * 100 / max ))
notify-send "curse-- :D" "$percent%"
