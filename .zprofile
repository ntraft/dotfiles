# Import login shell things which are not specific to bash shells. Also imports
# some useful functions that will be used by other files, so this should come
# first.
source $HOME/.common_profile

if [ -n "$SHELL_DEBUG" ]; then
    echo "Running .zprofile"
fi

# Source some files that should only contain system-specific settings that
# should not be shared across machines.
if [ -f $HOME/.local/zsh_profile ]; then
	source $HOME/.local/zsh_profile
fi
