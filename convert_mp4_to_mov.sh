#!/bin/bash

# --- Check if Homebrew is installed ---
if ! command -v brew &>/dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/usr/local/bin/brew shellenv)"
fi

# --- Check if FFmpeg is installed ---
if ! command -v ffmpeg &>/dev/null; then
    echo "FFmpeg not found. Installing FFmpeg..."
    brew install ffmpeg
fi

# --- Ask user to select an MP4 file ---
echo "Please choose an MP4 file to convert..."
FILE=$(osascript -e 'POSIX path of (choose file of type {"mp4"} with prompt "Select an MP4 file to convert")')

# --- Check if user cancelled ---
if [ -z "$FILE" ]; then
    echo "No file selected. Exiting."
    exit 1
fi

# --- Define output path (Desktop with same name but .mov) ---
BASENAME=$(basename "$FILE" .mp4)
OUTPUT="$HOME/Desktop/${BASENAME}.mov"

# --- Run conversion ---
echo "Converting $FILE to $OUTPUT ..."
ffmpeg -i "$FILE" -c:v copy -c:a copy "$OUTPUT"

echo "Conversion complete! File saved to Desktop."
