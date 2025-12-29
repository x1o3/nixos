#!/usr/bin/env bash

BATTERY_PATH=$(readlink -f /sys/class/power_supply/BAT*)
CHECK_INTERVAL=1  

notify_low=0
notify_critical=0
notify_enough=0
notify_full=0
notify_charging=0
notify_discharging=0

prev_status=""

if [[ ! -d "$BATTERY_PATH" ]]; then
  echo "Battery path $BATTERY_PATH not found."
  exit 1
fi

while true; do

  capacity=$(cat "$BATTERY_PATH/capacity")
  status=$(cat "$BATTERY_PATH/status")
  capacity=${capacity%.*}

  if [[ "$capacity" -le 10 && "$status" == "Discharging" && $notify_critical -eq 0 ]]; then
    notify-send -u critical "I AM DYING!!!!" "FATHERRRRR ${capacity}%!"
    notify_critical=1
    notify_low=0
    notify_enough=0
    notify_full=0

  elif [[ "$capacity" -le 25 && "$capacity" -gt 10 && "$status" == "Discharging" && $notify_low -eq 0 ]]; then
    notify-send -u critical "Oh no :(" "hwelp!!! ${capacity}%"
    notify_low=1
    notify_critical=0
    notify_enough=0
    notify_full=0

  elif [[ "$capacity" -ge 80 && "$capacity" -lt 100 && ("$status" == "Charging" || "$status" == "Full") && $notify_enough -eq 0 ]]; then
    notify-send -u low "M GOOD :D" "${capacity}%"
    notify_enough=1
    notify_low=0
    notify_critical=0
    notify_full=0

  elif [[ "$capacity" -eq 100 && "$status" == "Full" && $notify_full -eq 0 ]]; then
    notify-send -u low "Pregnant TvT"
    notify_full=1
    notify_low=0
    notify_critical=0
    notify_enough=0

  # Reset notifications when battery level/status changes away from thresholds
  elif [[ "$capacity" -gt 25 && $notify_low -eq 1 ]]; then
    notify_low=0
  elif [[ "$capacity" -gt 10 && $notify_critical -eq 1 ]]; then
    notify_critical=0
  elif [[ "$capacity" -lt 80 && $notify_enough -eq 1 ]]; then
    notify_enough=0
  elif [[ "$capacity" -lt 100 && $notify_full -eq 1 ]]; then
    notify_full=0
  fi

if [ "$status" != "$prev_status" ]; then
    case "$status" in
      "Charging")
        notify-send -u normal "Breathing :D (${capacity}%)"
        notify_charging=1
        notify_discharging=0
        ;;
      "Discharging")
        notify-send -u normal "Bleeding :( (${capacity}%)"
        notify_discharging=1
        notify_charging=0
        ;;
    esac
    prev_status="$status"
  fi
  
  sleep "$CHECK_INTERVAL"
done
