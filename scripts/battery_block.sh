#!/bin/sh

charging_status=$(cat "/sys/class/power_supply/BAT0/status")

case $charging_status in
    "Full") icon="⚡" ;;
    "Charging") icon="🔌" ;;
    "Discharging") icon="🔋" ;;
    "*") icon="🛑" ;;
esac

capacity=$(cat "/sys/class/power_supply/BAT0/capacity")

if [ $charging_status = "Discharging" ] && [ $capacity -lt 20 ]; then
    printf "❗ $capacity"
else
    printf "$icon $capacity%%"
fi






