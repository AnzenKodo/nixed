# System Dir
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export PATH="$HOME/.local/bin:$PATH"

# Application
export ZSH="$XDG_DATA_HOME/zsh/oh-my-zsh"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XSERVERRC="$XDG_CONFIG_HOME/X11/xserverrc"
export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
# export HISTFILE="$XDG_DATA_HOME/bash/history"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GTK_RC_FILES="$XDG_CONFIG_HOME/gtk-1.0/gtkrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"

# Z Shell

## Looks
ZSH_THEME=random
ZSH_THEME_RANDOM_QUIET=true # Hide theme message
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
# DISABLE_LS_COLORS="true" # LS Colors
# DISABLE_AUTO_TITLE="true" # Auto set terminal title
# DISABLE_MAGIC_FUNCTIONS=true # URLs and other text is messed up.

## Message format
GIT_COMMIT_MSG="latest $(date)"
# HIST_STAMPS="mm/dd/yyyy"

## Completion
CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true" # Show dots while loading

## Update
# DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT="true"
# export UPDATE_ZSH_DAYS=13

## Z Shell File
ZSH_HISTORY_FILE_NAME=".zsh_history"
ZSH_HISTORY_FILE="$ZSH/zsh_hiistory/${ZSH_HISTORY_FILE_NAME}"
ZSH_HISTORY_PROJ="$zsh/zsh_hiistory/.zsh_history_proj"
ZSH_HISTORY_FILE_ENC_NAME="zsh_history"
ZSH_HISTORY_FILE_ENC="${ZSH_HISTORY_PROJ}/${ZSH_HISTORY_FILE_ENC_NAME}"
# ZSH_CUSTOM=/path/to/new-custom-folder

## Other Z Shell
ENABLE_CORRECTION="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true" # Disable untracked files as dirty
# export MANPATH="/usr/local/man:$MANPATH"
# export LANG=en_US.UTF-8
# export ARCHFLAGS="-arch x86_64" # Compilation flags

# Plugins
plugins=(
  #adb
  branch
  catimg colored-man-pages colorize command-not-found copydir copyfile cp
  dirhistory debian #dotenv
  extract emoji encode64 extract
  frontend-search
  git git-extras git-auto-fetch git-escape-magic gitfast git-prompt github gitignore
  gpg-agent #gulp
  history history-substring-search
  jsontools jump
  last-working-dir
  man
  node npm nvm #npx
  per-directory-history pip perms pipenv pj please python
  repo rsync
  safe-paste salt scd sdk spring supervisor systemd
  themes timer transfer #torrent
  ubuntu urltools
  vi-mode #vundle #vim-interaction vscode #vagrant #virtualenv
  web-search wd
  #yarn
  zsh-autosuggestions zsh-syntax-highlighting #a
)

source $ZSH/oh-my-zsh.sh

# Alias
alias config="/usr/bin/git --git-dir=$HOME/.config/dotfiles.git --work-tree=$HOME"
alias rm="trash-put"
alias cp="cp -iv"
alias mv="mv -iv"
alias bash="bash -o vi"
alias cal="cal -y"
alias grep="grep -i"
alias ls="ls -A"
alias mkdir="mkdir -v"
