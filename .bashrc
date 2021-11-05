# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# 
# Modified by Neil Traft

# For now, let's run "common" things first, since they contain convenience
# functions that we want to use everywhere. After that, we customize these base
# options for each particular shell.
source ~/.commonrc

if $SHELL_DEBUG; then
    echo "Running .bashrc"
fi

# Source global definitions first.
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Allow globs to expand hidden files
shopt -s dotglob

# Set up virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Development
# This is obsolete since Python 3.4 or so, and since we're using python3 by
# default it only results in errors. So I guess let's disable it for now, and
# probably delete these lines altogether in the future.
#if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
#	source /usr/local/bin/virtualenvwrapper.sh
#fi

# If not running interactively, don't do anything further.
if [ -z "$PS1" ]; then
	# However, we still want to give a chance for any system-specific actions
	# that need to be taken in all shells (such as conda setup).
	if [ -f $HOME/.local/bashrc ]; then
		source $HOME/.local/bashrc
	fi
	return
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Customize terminal window title to be similar to PS1 prompt.
function print_command_prompt() {
    CURRDIR="${PWD/#$HOME/~}"  # Replace HOME w/ tilde.
	CURRDIR="${CURRDIR##*/}"  # Trim full path, keep only final dir.
	printf $1 "${HOSTNAME%%.*}" "${CURRDIR}"  # Print using given syntax.
}
case $TERM in
xterm*|vte*)
  if [ -e /etc/sysconfig/bash-prompt-xterm ]; then
      PROMPT_COMMAND=/etc/sysconfig/bash-prompt-xterm
  elif [ "${VTE_VERSION:-0}" -ge 3405 ]; then
      PROMPT_COMMAND="__vte_prompt_command"
  else
      PROMPT_COMMAND='print_command_prompt "\033]0;%s:%s\007"'
  fi
  ;;
screen*)
  if [ -e /etc/sysconfig/bash-prompt-screen ]; then
      PROMPT_COMMAND=/etc/sysconfig/bash-prompt-screen
  else
      PROMPT_COMMAND='print_command_prompt "\033k%s:%s\033\\"'
  fi
  ;;
*)
  [ -e /etc/sysconfig/bash-prompt-default ] && PROMPT_COMMAND=/etc/sysconfig/bash-prompt-default
  ;;
esac

# Color the prompt
export PS1="\[$(tput setaf 2)\]\u@\h:\[$(tput setaf 5)\]\W\[$(tput setaf 2)\] $\[$(tput sgr0)\] "

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Add an "alert" alias for long running commands. Only works on Ubuntu; may
# need to install libnotify-bin. Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Source some files that should only contain system-specific settings that
# should not be shared across machines.
if [ -f $HOME/.local/bashrc ]; then
	source $HOME/.local/bashrc
fi
