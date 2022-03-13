#!/usr/bin/env bash

# Start the programs when Qtile starts.

# Random Wallpaper
file_location=~/.cache/background2.jpg
unsplashUrl=https://source.unsplash.com/1300x700/?
# Downloads dark wallpaper after 18:00 or download bright wallpaper
if [ $(date +%H) -ge 18 ]
then
	curl -L "${unsplashUrldark}dark-wallpaper" --connect-timeout 30 > $file_location
	mv $file_location ~/.cache/background.jpg
else
	curl -L "${unsplashUrl}bright-blue" --connect-timeout 30 > $file_location
	mv $file_location ~/.cache/background.jpg
fi &

# Backup File
# $HOME/.local/bin/backup &

# Transparent window
picom &

# Clipboard
clipmenud &
