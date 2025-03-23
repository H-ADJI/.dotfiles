#!/bin/sh
# Set default duration in seconds (e.g., 20 minutes = 1200 seconds)
DURATION=5400
timeout=8000
APP_NAME="Timer"
# The script will run continuously so Waybar gets live updates.
# Calculate hours and minutes correctly
hours=$((DURATION / 3600))
minutes=$(((DURATION % 3600) / 60)) # Get remaining minutes

# Format as HH:MM
hours=$(printf "%02d" $hours)
minutes=$(printf "%02d" $minutes)
notify-send "Timer Activated" "Your $hours:$minutes of focused work has started !" -t "$timeout" -a "$APP_NAME"
while [ $DURATION -ge 0 ]; do
    sleep 1
    DURATION=$((DURATION - 1))
done
# When the countdown reaches zero, send a notification
notify-send "Time is up" "Time to rest your eyes and take a walk!" -t "$timeout" -a "$APP_NAME"
paplay /usr/share/sounds/freedesktop/stereo/complete.oga
