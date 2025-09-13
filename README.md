# MP4 → MOV Converter (macOS, FFmpeg)

A tiny macOS bash utility that installs FFmpeg (via Homebrew if needed) and **losslessly remuxes** a chosen `.mp4` into a `.mov` on your Desktop using a native file picker.

> **Why it’s fast:** The script performs a **remux** (`-c copy`)—it copies the audio/video streams into a MOV container without re-encoding. If your MP4 uses MOV-friendly codecs (e.g., H.264 + AAC), conversion is near-instant and preserves quality.

---

## Features
- One-file script; macOS-friendly
- Auto-installs **Homebrew** (if missing)
- Auto-installs **FFmpeg** (if missing)
- Native file picker (`osascript`)
- **Lossless** stream copy (`-c:v copy -c:a copy`)
- Outputs to your **Desktop** with the same base filename

---

## Requirements
- macOS
- Internet connection on first run (for Homebrew/FFmpeg installation)

---

## Installation & Usage
1. Save the script file locally (e.g., `~/Desktop/mp4_to_mov.sh`).
2. Make it executable:
   
       chmod +x ~/Desktop/mp4_to_mov.sh

3. Run it:

       ~/Desktop/mp4_to_mov.sh

4. When the macOS file picker appears, choose an `.mp4`.  
   The resulting `.mov` will be written to your **Desktop**.

**Tip (double-click from Finder):**  
Rename to `mp4_to_mov.command`, keep it executable (`chmod +x`), then double-click to run in Terminal.

---

## Apple Silicon (M1/M2/M3) Note
Homebrew typically installs under `/opt/homebrew`. If the script can’t find `brew` after installation, update the `brew shellenv` line to use `/opt/homebrew/bin/brew` instead of `/usr/local/bin/brew`.

---

## Troubleshooting

- **`ffmpeg: command not found`**  
  Re-run the script so it can install FFmpeg, or install manually via Homebrew.

- **macOS blocked the script**  
  System Settings → Privacy & Security → allow the script under Security, then run again.

- **“Could not find tag for codec” / MOV won’t accept streams**  
  Your MP4’s streams may not be MOV-compatible. Switch to a re-encode (slower but universal) by replacing the FFmpeg step with a line that encodes video (e.g., H.264) and audio (e.g., AAC).

- **Change output folder**  
  Edit the output path in the script to point to your preferred directory (e.g., `~/Movies`).

---

## What This Tool Does
1. Installs **Homebrew** if missing  
2. Installs **FFmpeg** if missing  
3. Prompts you to choose an `.mp4` via a native picker  
4. **Remuxes** streams into a `.mov` (no quality loss)  
5. Saves the result to your **Desktop**
