#!/usr/bin/env bash

# Define menu options (keys) and their corresponding actions
keys=(
    $'\uf023   Log Out'
    $'\uf186   Suspend'
    $'\uf2dc   Hibernate'
    $'\uf021   Reboot'
    $'\uf011   Shutdown'
)

actions=(
    "swaymsg exit"
    "systemctl suspend"
    "systemctl hibernate"
    "systemctl reboot"
    "systemctl poweroff"
)

# Combine the keys into a newline-separated string for the menu
options=$(printf "%s\n" "${keys[@]}")

# Launch wofi with the given options and capture the selected menu item
choice=$(echo -e "$options" | wofi -d -i -p 'Power Menu' -W 100 -H 175 -k /dev/null)

# Find the index of the selected choice in the keys array
index=-1
for i in "${!keys[@]}"; do
    if [[ "${keys[$i]}" == "$choice" ]]; then
        index=$i
        break
    fi
done

# If a valid option was selected, execute its corresponding action
if [ "$index" -ne -1 ]; then
    paplay /usr/share/sounds/freedesktop/stereo/service-logout.oga &
    sleep 1.2
    ${actions[$index]}
fi
