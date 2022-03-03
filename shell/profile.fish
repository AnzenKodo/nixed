#!/usr/bin/env fish

# Disable welcome message
set fish_greeting

# Import colors
# . "$HOME/.cache/wal/colors.fish"

# Vi mode
fish_vi_key_bindings

# Start Window Manger if you are on tty1
if [ (tty) = "/dev/tty1" ]
    pgrep qtile || startq
end

# To initialize zoxide
zoxide init fish | source
alias cd="z"

set shell_location ~/.config/nixed/shell
source $sell_location/alias
source $shell_location/prompt.fish
bash -c "source "$shell_location"/export"
