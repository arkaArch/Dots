#! /bin/bash

function notify() {
    max_light=$(brightnessctl m)
    present_light=$(brightnessctl g)
    light=$((($present_light * 100) / $max_light))
    dunstify -a "change-brightness" -u low -r 9998 -h int:value:"$light" -i brightness "Brightness: ${light}%" -t 1000
}

case $1 in
up)
    brightnessctl s 5%+
    notify $1
    kill -46 $(pidof dwmblocks)
    ;;
down)
    brightnessctl s 5%-
    notify $1
    kill -46 $(pidof dwmblocks)
esac
