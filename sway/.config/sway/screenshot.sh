#!/bin/sh
# Create the directory if it doesn't exist
SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SCREENSHOT_DIR"
timeout=5000
# Generate a filename based on the current date and time
FILENAME="$SCREENSHOT_DIR/screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png"
APP_NAME="Sway Screenshot"
case $1 in
    screen)
        grim - | tee "$FILENAME" | wl-copy
        notify-send "Screenshot taken" "Saved to $FILENAME" -t "$timeout" -i "$FILENAME" -a "$APP_NAME"
        ;;
    region)
        grim -g "$(slurp)" - | tee "$FILENAME" | wl-copy
        notify-send "Screenshot taken" "Saved to $FILENAME" -t "$timeout" -i "$FILENAME" -a "$APP_NAME"
        ;;
esac
