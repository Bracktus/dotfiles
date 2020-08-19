# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [[ "$(tty)" == "/dev/tty1" ]]
 then
     echo "Power:"
     cat /sys/class/power_supply/BAT0/capacity
fi

# adding PATH variables
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/bin/bspwm:$PATH"
export PATH="$HOME/bracktus/.local.bin:$PATH"
export PATH="$HOME/.config/gems/bin:$PATH"


#XDG Base directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# cleaning up the home directory
export MYSQL_HISTFILE="$XDG_DATA_HOME/mysql_history"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export ATOM_HOME="$XDG_DATA_HOME/atom"
export GEM_HOME="$HOME/.config/gems"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export LESSHISTFILE=-

# My Env Vars
export EDITOR="nvim"
export BAT_THEME="ansi-dark"
