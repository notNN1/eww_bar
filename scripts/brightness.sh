#!/bin/sh

icon() {
    brightness=$(light -G | cut -d '.' -f1)
    
    while [ true ]
    do
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

        last=$brightness
        brightness=$(light -G | cut -d '.' -f1)

        while [ "$last" == "$brightness" ]
        do
            sleep .5s
            brightness=$(light -G | cut -d '.' -f1)
        done
    done
}

brightness() {
    brightness=$(light -G)
    echo "$brightness"
}

[ "$1" = "icon" ] && icon
[ "$1" = "brightness" ] && brightness && exit