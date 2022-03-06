#!/usr/bin/env bash

# Start the programs when Qtile starts.

# Random Wallpaper
$HOME/.local/bin/wallpaper &

# Backup File
$HOME/.local/bin/backup &

# Disable keyboard
xinput disable "AT Translated Set 2 keyboard"

# Transparent window
picom &

# Clipboard
clipmenud
