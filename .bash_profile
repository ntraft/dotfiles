source ~/.profile

# Allow globs to expand hidden files
shopt -s dotglob nullglob

# I use .bashrc for local machine tweaks that shouldn't be synced.
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# Color the prompt
export PS1="\[$(tput setaf 2)\]\u@\h:\[$(tput setaf 5)\]\w \[$(tput sgr0)\]$ "

