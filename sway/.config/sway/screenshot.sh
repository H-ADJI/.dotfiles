#!/bin/sh
# Create the directory if it doesn't exist
SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SCREENSHOT_DIR"

# Generate a filename based on the current date and time
FILENAME="$SCREENSHOT_DIR/screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png"
case $1 in
    screen)
        grim - | tee "$FILENAME" | wl-copy
        ;;
    region)
        grim -g "$(slurp)" - | tee "$FILENAME" | wl-copy
        ;;
esac
