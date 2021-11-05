# Import login shell things which are not specific to bash shells. Also imports
# some useful functions that will be used by other files, so this should come
# first.
source $HOME/.common_profile

if $SHELL_DEBUG; then
    echo "Running .bash_profile"
fi

# Source some files that should only contain system-specific settings that
# should not be shared across machines.
if [ -f $HOME/.local/bash_profile ]; then
	source $HOME/.local/bash_profile
fi

# if running in bash...
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi
