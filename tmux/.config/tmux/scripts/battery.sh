#!/bin/bash

# Get the battery device path
BATTERY=$(upower -e | grep -m 1 'BAT')

# Extract and print the percentage
if [ -n "$BATTERY" ]; then
    upower -i "$BATTERY" | awk '/percentage/ {print $2}'
else
    echo "N/A"
fi
