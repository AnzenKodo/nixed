# Export

## System directory
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx NIXED $XDG_CONFIG_HOME/nixed
set -gx PYTHONPATH $XDG_CONFIG_HOME/pip
set -gx DENO_INSTALL_ROOT $XDG_CONFIG_HOME/deno

## Add Path
fish_add_path $HOME/.local/bin
fish_add_path $XDG_CONFIG_HOME/npm/bin
fish_add_path $XDG_CONFIG_HOME/deno/bin

#Import colors
# . "$HOME/.cache/wal/colors.fish"


# Alias
# alias drun="dmenu_run -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15""
alias icat="kitty +kitten icat" # Show image in terminal
alias rm="trash-put"
alias cp="cp -iv"
alias mv="mv -iv"
alias bash="bash -o vi"
alias cal="cal -y"
alias grep="grep -i"
alias ls="ls -A --color=always"
alias mkdir="mkdir -v"
alias startq="startx /usr/bin/env qtile start -c ~/.config/nixed/qtile/config.py"
alias note="nvim ~/Documents/notes/index.md"
alias todo="nvim ~/Documents/notes/Todo.md"
alias tree="find . | sed -e 's/[^-][^\/]*\// |/g' -e 's/|\([^ ]\)/|-\1/'"
# Start Window Manger
if [ (tty) = "/dev/tty1" ]
    pgrep qtile || startq
end

# Disable welcome message
set fish_greeting

# Gnome Keyring startup
# set -x (gnome-keyring-daemon --start | string split "=")

# Vi mode
fish_vi_key_bindings

### fish function to extract generic compressed archives ###

function ex
	if test $argv && test -e $argv
		switch $argv
		case '*.tar.bz2'
			tar xjf $argv
		case '*.tar.gz'
			tar xzf $argv
		case "*.bz2"
			bunzip2 $argv
		case "*.rar"
			unar x $argv
		case "*.gz"
			gunzip $argv
		case "*.tar"
			tar xf $argv
		case "*.tbz2"
			tar xjf $argv
		case "*.tgz"
			tar xzf $argv
		case "*.zip"
			unzip $argv
		case "*.Z"
			uncompress $argv
		case "*.7z"
			7z x $argv
		case "*.deb"
			ar x $argv
		case "*.tar.xz"
			tar xf $argv
		case '*'
			echo "Could not determine file type or cannot be extracted"
		end
	else
		echo "No file provided"
	end
end

### zoxide ###

# ===============================================
# Utility functions for zoxide.
#

# pwd based on the value of _ZO_RESOLVE_SYMLINKS.
function __zoxide_pwd
    builtin pwd -L
end

# A copy of fish's internal cd function. This makes it possible to use
# `alias cd=z` without causing an infinite loop.
if ! builtin functions -q __zoxide_cd_internal
    if builtin functions -q cd
        builtin functions -c cd __zoxide_cd_internal
    else
        alias __zoxide_cd_internal='builtin cd'
    end
end

# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd
    __zoxide_cd_internal $argv
end

# =============================================================================
#
# Hook configuration for zoxide.
#

# Initialize hook to add new entries to the database.
function __zoxide_hook --on-variable PWD
    test -z "$fish_private_mode"
    and command zoxide add -- (__zoxide_pwd)
end

# =============================================================================
#
# When using zoxide with --no-aliases, alias these internal functions as
# desired.
#

# Jump to a directory using only keywords.
function __zoxide_z
    set argc (count $argv)
    if test $argc -eq 0
        __zoxide_cd $HOME
    else if test "$argv" = -
        __zoxide_cd -
    else if test $argc -eq 1 -a -d $argv[1]
        __zoxide_cd $argv[1]
    else
        set -l result (command zoxide query --exclude (__zoxide_pwd) -- $argv)
        and __zoxide_cd $result
    end
end

# Completions for `z`.
function __zoxide_z_complete
    set -l tokens (commandline -op)
    set -l curr_tokens (commandline -cop)

    if test (count $tokens) -le 2 -a (count $curr_tokens) -eq 1
        # If there are < 2 arguments, use `cd` completions.
        __fish_complete_directories "$tokens[2]" ''
    else if test (count $tokens) -eq (count $curr_tokens)
        # If the last argument is empty, use interactive selection.
        set -l query $tokens[2..-1]
        set -l result (zoxide query -i -- $query)
        and commandline -p "$tokens[1] "(string escape $result)
        commandline -f repaint
    end
end

# Jump to a directory using interactive search.
function __zoxide_zi
    set -l result (command zoxide query -i -- $argv)
    and __zoxide_cd $result
end

# =============================================================================
#
# Convenient aliases for zoxide. Disable these using --no-aliases.
#

# Remove definitions.
function __zoxide_unset
    set --erase $argv >/dev/null 2>&1
    abbr --erase $argv >/dev/null 2>&1
    builtin functions --erase $argv >/dev/null 2>&1
end

__zoxide_unset z
alias z=__zoxide_z
complete -c z -e
complete -c z -f -a '(__zoxide_z_complete)'

__zoxide_unset zi
alias zi=__zoxide_zi

### Prompt from https://github.com/mattgreen/lucid.fish ###
if ! set -q lucid_dirty_indicator
    set -g lucid_dirty_indicator "•"
end

if ! set -q lucid_prompt_symbol
    set -g lucid_prompt_symbol "❯"
end

if ! set -q lucid_prompt_symbol_error
    set -g lucid_prompt_symbol_error "❯"
end

if ! set -q lucid_prompt_symbol_color
    set -g lucid_prompt_symbol_color "$fish_color_normal"
end

if ! set -q lucid_prompt_symbol_error_color
    set -g lucid_prompt_symbol_error_color "$fish_color_normal"
end

# This should be set to be at least as long as lucid_dirty_indicator, due to a fish bug
if ! set -q lucid_clean_indicator
    set -g lucid_clean_indicator (string replace -r -a '.' ' ' $lucid_dirty_indicator)
end

if ! set -q lucid_cwd_color
    set -g lucid_cwd_color green
end

if ! set -q lucid_git_color
    set -g lucid_git_color blue
end

# State used for memoization and async calls.
set -g __lucid_cmd_id 0
set -g __lucid_git_state_cmd_id -1
set -g __lucid_git_static ""
set -g __lucid_dirty ""

# Increment a counter each time a prompt is about to be displayed.
# Enables us to distingish between redraw requests and new prompts.
function __lucid_increment_cmd_id --on-event fish_prompt
    set __lucid_cmd_id (math $__lucid_cmd_id + 1)
end

# Abort an in-flight dirty check, if any.
function __lucid_abort_check
    if set -q __lucid_check_pid
        set -l pid $__lucid_check_pid
        functions -e __lucid_n_finish_$pid
        command kill $pid >/dev/null 2>&1
        set -e __lucid_check_pid
    end
end

function __lucid_git_status
    # Reset state if this call is *not* due to a redraw request
    set -l prev_dirty $__lucid_dirty
    if test $__lucid_cmd_id -ne $__lucid_git_state_cmd_id
        __lucid_abort_check

        set __lucid_git_state_cmd_id $__lucid_cmd_id
        set __lucid_git_static ""
        set __lucid_dirty ""
    end

    # Fetch git position & action synchronously.
    # Memoize results to avoid recomputation on subsequent redraws.
    if test -z $__lucid_git_static
        # Determine git working directory
        set -l git_dir (command git --no-optional-locks rev-parse --absolute-git-dir 2>/dev/null)
        if test $status -ne 0
            return 1
        end

        set -l position (command git --no-optional-locks symbolic-ref --short HEAD 2>/dev/null)
        if test $status -ne 0
            # Denote detached HEAD state with short commit hash
            set position (command git --no-optional-locks rev-parse --short HEAD 2>/dev/null)
            if test $status -eq 0
                set position "@$position"
            end
        end

        # TODO: add bisect
        set -l action ""
        if test -f "$git_dir/MERGE_HEAD"
            set action "merge"
        else if test -d "$git_dir/rebase-merge"
            set branch "rebase"
        else if test -d "$git_dir/rebase-apply"
            set branch "rebase"
        end

        set -l state $position
        if test -n $action
            set state "$state <$action>"
        end

        set -g __lucid_git_static $state
    end

    # Fetch dirty status asynchronously.
    if test -z $__lucid_dirty
        if ! set -q __lucid_check_pid
            # Compose shell command to run in background
            set -l check_cmd "git --no-optional-locks status -unormal --porcelain --ignore-submodules 2>/dev/null | head -n1 | count"
            set -l cmd "if test ($check_cmd) != "0"; exit 1; else; exit 0; end"

            begin
                # Defer execution of event handlers by fish for the remainder of lexical scope.
                # This is to prevent a race between the child process exiting before we can get set up.
                block -l

                set -g __lucid_check_pid 0
                command fish --private --command "$cmd" >/dev/null 2>&1 &
                set -l pid (jobs --last --pid)

                set -g __lucid_check_pid $pid

                # Use exit code to convey dirty status to parent process.
                function __lucid_on_finish_$pid --inherit-variable pid --on-process-exit $pid
                    functions -e __lucid_on_finish_$pid

                    if set -q __lucid_check_pid
                        if test $pid -eq $__lucid_check_pid
                            switch $argv[3]
                                case 0
                                    set -g __lucid_dirty_state 0
                                    if status is-interactive
                                        commandline -f repaint
                                    end
                                case 1
                                    set -g __lucid_dirty_state 1
                                    if status is-interactive
                                        commandline -f repaint
                                    end
                                case '*'
                                    set -g __lucid_dirty_state 2
                                    if status is-interactive
                                        commandline -f repaint
                                    end
                            end
                        end
                    end
                end
            end
        end

        if set -q __lucid_dirty_state
            switch $__lucid_dirty_state
                case 0
                    set -g __lucid_dirty $lucid_clean_indicator
                case 1
                    set -g __lucid_dirty $lucid_dirty_indicator
                case 2
                    set -g __lucid_dirty "<err>"
            end

            set -e __lucid_check_pid
            set -e __lucid_dirty_state
        end
    end

    # Render git status. When in-progress, use previous state to reduce flicker.
    set_color $lucid_git_color
    echo -n $__lucid_git_static ''

    if ! test -z $__lucid_dirty
        echo -n $__lucid_dirty
    else if ! test -z $prev_dirty
        set_color --dim $lucid_git_color
        echo -n $prev_dirty
        set_color normal
    end

    set_color normal
end

function __lucid_vi_indicator
    if [ $fish_key_bindings = "fish_vi_key_bindings" ]
        switch $fish_bind_mode
            case "insert"
                set_color green
                echo -n "[I] "
            case "default"
                set_color red
                echo -n "[N] "
            case "visual"
                set_color yellow
                echo -n "[S] "
            case "replace"
                set_color blue
                echo -n "[R] "
        end
        set_color normal
    end
end

# Suppress default mode prompt
function fish_mode_prompt
end

function fish_prompt
    set -l last_pipestatus $pipestatus
    set -l cwd (pwd | string replace "$HOME" '~')

    if test -z "$lucid_skip_newline"
        echo ''
    end

    set_color $lucid_cwd_color
    echo -sn $cwd
    set_color normal

    if test $cwd != '~'; or test -n "$lucid_git_status_in_home_directory"
        set -l git_state (__lucid_git_status)
        if test $status -eq 0
            echo -sn " on $git_state"
        end
    end

    echo ''
    __lucid_vi_indicator

    set -l prompt_symbol "$lucid_prompt_symbol"
    set -l prompt_symbol_color "$lucid_prompt_symbol_color"

    for status_code in $last_pipestatus
        if test "$status_code" -ne 0
            set prompt_symbol "$lucid_prompt_symbol_error"
            set prompt_symbol_color "$lucid_prompt_symbol_error_color"
            break
        end
    end

    set_color "$prompt_symbol_color"
    echo -n "$prompt_symbol "
    set_color normal
end

alias cd='z'
