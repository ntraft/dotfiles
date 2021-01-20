# if running in bash...
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

[ -r /Users/ntraft/.profile_lda ] && . /Users/ntraft/.profile_lda
