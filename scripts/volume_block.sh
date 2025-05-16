#!/bin/sh
vol=$(pamixer --get-volume)

if $(pamixer --get-mute); then
    printf "🔇"
else
    if [ $vol -ge 70 ]; then
        printf "🔊 $vol%%"
    elif [ $vol -ge 30 ]; then
        printf "🔉 $vol%%"
    else
        printf "🔈 $vol%%"
    fi
fi
