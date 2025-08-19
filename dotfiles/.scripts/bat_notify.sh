!#/run/current-system/sw/bin/fish

export DISPLAY=:0
export DBUS_SESSION_BS_ADDRESS=$(dbus-launch | grep ADDRESS | cut -d= -f2)
ICON_DIR="$HOME/dotfiles/dunst/images"

# Get battery info from acpi
battery_info=$(acpi -b)
battery_percentage=$(echo "$battery_info" | grep -oP '\d+(?=%)')
battery_state=$(echo "$battery_info" | grep -oP '(Charging|Discharging|Full|Unknown)')

# Function to send notification with icon and urgency
send_notification() {
    local urgency=$1
    local message=$2
    local icon_path=$3
    notify-send -u "$urgency" -i "$icon_path" "Battery Status" "$message"
}

if [[ "$battery_state" == "Charging" ]]; then
    send_notification "normal" "Battery is charging (${battery_percentage}%)" "$ICON_DIR/battery-charging.png"
elif [[ "$battery_state" == "Full" ]]; then
    if (( battery_percentage >= 80 )); then
        send_notification "normal" "Battery is charged (${battery_percentage}%)" "$ICON_DIR/battery-charged.png"
    fi
else
    if (( battery_percentage <= 5 )); then
        send_notification "critical" "Battery is critically low (${battery_percentage}%)" "$ICON_DIR/battery-low.png"
    elif (( battery_percentage <= 10 )); then
        send_notification "normal" "Battery is low (${battery_percentage}%)" "$ICON_DIR/battery-low.png"
    elif (( battery_percentage <= 20 )); then
        send_notification "low" "Battery is below 20% (${battery_percentage}%)" "$ICON_DIR/battery-low.png"
    fi
fi
