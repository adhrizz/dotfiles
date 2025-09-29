#!/bin/bash

# Script to send a brightness notification to dunst

# Get brightness percentage from brightnessctl
BRIGHTNESS=$(brightnessctl get)
MAX_BRIGHTNESS=$(brightnessctl max)
PERCENTAGE=$((BRIGHTNESS * 100 / MAX_BRIGHTNESS))

# Set a stack tag to replace existing notifications
TAG="backlight_notification"

# Send the notification
dunstify -a "Backlight" -u low -i "display-brightness-symbolic" -h int:value:"$PERCENTAGE" -h string:x-dunst-stack-tag:"$TAG" "Brightness: ${PERCENTAGE}%"

