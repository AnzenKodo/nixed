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
clipmenud &

# Gnome Key chain
# eval $(gnome-keyring-daemon --start --components=ssh,secrets)
# export SSH_AUTH_SOCK
# dbus-update-activation-environment --systemd DISPLAY
eval $(/run/wrappers/bin/gnome-keyring-daemon --start --components=ssh)
