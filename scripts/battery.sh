#!/bin/sh

bat=/sys/class/power_supply/BAT0/
per="$(cat "$bat/capacity")"

color() {

[ $(cat "$bat/status") = Charging ] && echo "#f4ff56" && exit

if [ "$per" -gt "50" ]; then
	color="#8adf62" 
elif [ "$per" -gt "25" ]; then
	color="#e6723c"
else 
	color="#fc2525"
fi
echo "$color"
}

percent() {
	if ["$per" -lt "33" ]; then
		notify-send -u critical "Battery Low" "Connect Charger"
	fi
	echo $per
}

[ "$1" = "color" ] && color && exit
[ "$1" = "percent" ] && percent && exit
exit