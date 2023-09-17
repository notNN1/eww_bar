#!/bin/sh

icon() {
    brightness=$(light -G | cut -d '.' -f1)
    if [ "$brightness" -gt "75" ]; then
        icon="󰃠"
    elif [ "$brightness" -gt "50" ]; then
        icon="󰃟"
    elif [ "$brightness" -gt "25" ]; then
        icon="󰃞"
    else 
        icon="󰖐"
    fi

    echo "$icon"
}

brightness() {
    brightness=$(light -G)
    echo "$brightness"
}

[ "$1" = "icon" ] && icon && exit
[ "$1" = "brightness" ] && brightness && exit