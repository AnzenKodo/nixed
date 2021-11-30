# Export

## System directory
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx PATH $HOME/.local/bin:$PATH

## Application
set -gx XINITRC $XDG_CONFIG_HOME/X11/xinitrc
set -gx XSERVERRC $XDG_CONFIG_HOME/X11/xserverrc
set -gx ICEAUTHORITY $XDG_CACHE_HOME/ICEauthority
set -gx INPUTRC $XDG_CONFIG_HOME/readline/inputrc
set -gx GNUPGHOME $XDG_DATA_HOME/gnupg
set -gx HISTFILE $XDG_DATA_HOME/bash/history
set -gx CARGO_HOME $XDG_DATA_HOME/cargo
set -gx GTK_RC_FILES $XDG_CONFIG_HOME/gtk-1.0/gtkrc
set -gx GTK2_RC_FILES $XDG_CONFIG_HOME/gtk-2.0/gtkrc

# Alias
rm="trash-put"
cp="cp -iv"
mv="mv -iv"
bash="bash -o vi"
cal="cal -y"
grep="grep -i"
ls="ls -A"
mkdir="mkdir -v"
config="/usr/bin/git --git-dir=$HOME/.config/dotfiles.git --work-tree=$HOME"
wallpaper="bash wallpaper"
backup="bash backup"
