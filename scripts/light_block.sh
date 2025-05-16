#! /bin/bash

max_light=$(brightnessctl m)
present_light=$(brightnessctl g)
light=$((($present_light * 100) / $max_light))

if [ $light -ge 70 ]; then
    printf "🌕 $light%%"
elif [ $light -ge 30 ]; then
    printf "🌓 $light%%"
else
    printf "🌘 $light%%"
fi


