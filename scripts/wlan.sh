#!/bin/sh

bat=/sys/class/power_supply/BAT0/
per="$(cat "$bat/capacity")"

color() {

[ $(cat "$bat/status") = Charging ] && echo "" && exit

if [ "$per" -gt "66" ]; then
	color="#8adf62" 
elif [ "$per" -gt "33" ]; then
	color="#e6723c"
else 
	color="#fc2525"
    notify-send -u critical "Battery Low" "Connect Charger"
fi
echo "$color"
}

percent() {
	echo $per
}

[ "$1" = "color" ] && color && exit
[ "$1" = "percent" ] && percent && exit
exit