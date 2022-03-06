#!/usr/bin/env fish

# XDG base directory
# More info on --> https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
set -gx XDG_CACHE_HOME	~/.cache
set -gx XDG_CONFIG_HOME ~/.config
set -gx XDG_DATA_HOME		~/.local/share

# X11
set -gx XINITRC				$XDG_CONFIG_HOME/X11/xinitrc
set -gx XSERVERRC			$XDG_CONFIG_HOME/X11/xserverrc
set -gx XCOMPOSEFILE	$XDG_CONFIG_HOME/X11/xcompose
set -gx XCOMPOSECACHE $XDG_CACHE_HOME/X11/xcompose

# Applications
set -gx NIXED									$XDG_CONFIG_HOME/nixed
set -gx GTK_RC_FILES					$XDG_CONFIG_HOME/gtk-1.0/gtkrc
set -gx GTK2_RC_FILES					$XDG_CONFIG_HOME/gtk-2.0/gtkrc
set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
set -gx DENO_INSTALL_ROOT			$XDG_CONFIG_HOME/deno
set -gx GNUPGHOME							$XDG_CONFIG_HOME/gnupg
set -gx HISTFILE							$XDG_DATA_HOME/bash/history
set -gx NODE_REPL_HISTORY			$XDG_DATA_HOME/node_repl_history

# Add folder to your path
# Note don't forgot to include `:` in end before entering next folder path
set -gx PATH "$PATH:~/.local/bin:$XDG_CONFIG_HOME/npm/bin:$XDG_CONFIG_HOME/deno/bin"

# fish_add_path ~/.local/bin
# fish_add_path $XDG_CONFIG_HOME/npm/bin
# fish_add_path $XDG_CONFIG_HOME/deno/bin
