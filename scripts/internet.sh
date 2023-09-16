#!/bin/sh

icon() {
[ $(cat /sys/class/net/w*/operstate) = down ] && echo 󰤯 && exit
	if [ "nmcli | grep '^wlp'" != "wlp2s0: disconnected" ]; then
		echo "󰤨" && exit
	fi
	echo "󰌗" && exit
}

name() {
	nmcli | grep "^wlp\|^enp" | head -1 | sed 's/\ connected\ to\ /Connected to /g' | cut -d ':' -f2
}

[ "$1" = "icon" ] && icon && exit
[ "$1" = "name" ] && name && exit