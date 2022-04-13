#!/usr/bin/env bash

# Start the programs when Qtile starts.

# Random Wallpaper
# file_location=~/.cache/background2.jpg
# # Downloads dark wallpaper after 18:00 or download bright wallpaper
# if [ $(date +%H) -ge 18 ]
# then
# 	curl -L "https://source.unsplash.com/1300x700/?dark" --connect-timeout 30 -o $file_location
# 	mv $file_location ~/.cache/background.jpg
# else
# 	curl -L "https://source.unsplash.com/1300x700/?bright-blue" --connect-timeout 30 -o $file_location
# 	mv $file_location ~/.cache/background.jpg
# fi &

# Backup File
$HOME/.local/bin/backup &

# Transparent window
picom &

# Clipboard
clipmenud &
