#!/bin/bash

# Define output directory
OUTPUT_DIR="$HOME/Pictures/Screenshots/labwc"
mkdir -p "$OUTPUT_DIR"

# Generate filename with timestamp
FILENAME="labwc_screenshot_$(date +%Y-%m-%d_%H-%M-%S).jpg"
FULL_PATH="$OUTPUT_DIR/$FILENAME"

# Take screenshot of ALL outputs (full screen)
if grim "$FULL_PATH"; then
    # Notify user
    notify-send "Screenshot Taken" "Saved to $FULL_PATH" -i camera-photo
else
    notify-send "Screenshot Failed" "Could not save screenshot." -u critical
fi
