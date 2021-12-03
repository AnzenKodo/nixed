#!/usr/bin/env bash

# Random Wallpaper
$HOME/.local/bin/wallpaper &

# Backup File
# $HOME/.local/bin/backup &

# Disable keyboard
xinput disable "AT Translated Set 2 keyboard"

# Transparent window maker
picom &

# Clipboard
greenclip daemon &

# Gnome Key chain
eval $(/run/wrappers/bin/gnome-keyring-daemon --start --daemonize)
export SSH_AUTH_SOCK
