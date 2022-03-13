#!/usr/bin/env fish

# Sourcing files
set shell_location ~/.config/nixed/fish
source $shell_location/export.fish
source $shell_location/alias
source $shell_location/prompt.fish

# Disable welcome message
set fish_greeting

# Enable fish VI mode
fish_vi_key_bindings

# Start Window Manger if you are on tty1
if [ (tty) = "/dev/tty1" ]
    pgrep qtile || startq
end

# To initialize zoxide
zoxide init fish | source
alias cd="z"
