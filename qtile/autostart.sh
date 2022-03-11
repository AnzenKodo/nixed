#!/usr/bin/env bash

# Start the programs when Qtile starts.

# Random Wallpaper
$HOME/.local/bin/wallpaper &

# Backup File
$HOME/.local/bin/backup &

# Transparent window
picom &

# Clipboard
clipmenud &
