#!/bin/bash

# Script to send a volume notification to dunst with a 200% cap

# Get volume and mute status from pamixer
VOLUME=$(pamixer --get-volume)
MUTED=$(pamixer --get-mute)

# This is the new maximum volume we are aiming for.
# The progress bar will be scaled against this value.
MAX_VOLUME=200

# Calculate the percentage for the progress bar (a value between 0 and 100)
# This scales the current volume (which can go up to 200) to the 0-100 range that dunstify expects.
PROGRESS_PERCENTAGE=$((VOLUME * 100 / MAX_VOLUME))

# Ensure the progress bar doesn't go over 100 if the volume somehow exceeds MAX_VOLUME
if [ "$PROGRESS_PERCENTAGE" -gt 100 ]; then
  PROGRESS_PERCENTAGE=100
fi

TAG="volume_notification"

if [[ "$MUTED" == "true" ]]; then
  # Show muted icon and text. The bar will still show the last known volume level.
  dunstify -a "Volume" -u low -i "audio-volume-muted-symbolic" -h int:value:"$PROGRESS_PERCENTAGE" -h string:x-dunst-stack-tag:"$TAG" "Volume: Muted"
else
  # Show the actual volume level in the text, but use the scaled value for the progress bar
  dunstify -a "Volume" -u low -i "audio-volume-high-symbolic" -h int:value:"$PROGRESS_PERCENTAGE" -h string:x-dunst-stack-tag:"$TAG" "Volume: ${VOLUME}%"
fi
