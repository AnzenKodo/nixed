#!/usr/bin/env fish

# Sourcing files
set shell_location ~/.config/nixed/shell
source $shell_location/alias
source $shell_location/prompt.fish
# Sourcing bash files
bash -c "source "$shell_location"/export"

# Disable welcome message
set fish_greeting

# Import colors form pywal
# . "$HOME/.cache/wal/colors.fish"

# Enable fish VI mode
fish_vi_key_bindings

# Start Window Manger if you are on tty1
if [ (tty) = "/dev/tty1" ]
    pgrep qtile || startq
end

# To initialize zoxide
zoxide init fish | source
alias cd="z"
