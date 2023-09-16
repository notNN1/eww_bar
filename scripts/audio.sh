#!/bin/sh

icon() {
    mute=$(pamixer --get-mute)
    [ "$mute" == "true" ] && echo 󰝟 && exit

    vol=$(pamixer --get-volume)
    if [ "$vol" -gt "66" ]; then
        icon="󰕾"
    elif [ "$vol" -gt "33" ]; then
        icon=""
    else
        icon=""
    fi

    echo "$icon"
}

volume() {
    mute=$(pamixer --get-mute)
    [ "$mute" == "true" ] && echo 0 && exit

    vol=$(pamixer --get-volume)
    echo "$vol"
}

[ "$1" = "icon" ] && icon && exit
[ "$1" = "volume" ] && volume && exit