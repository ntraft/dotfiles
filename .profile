# Provides functions for adding items to PATH.
if [ -f $HOME/.add2path ]; then
	source $HOME/.add2path
fi

# My dev directory is always here.
DEVDIR=$HOME/Development


# MacPorts paths.
prepend2path '/opt/local/bin'
prepend2path '/opt/local/sbin'
# Man should be able to find the corresponding manpath automatically.
#export MANPATH=$MANPATH:/opt/local/share/man

# Homebrew path. 
prepend2path '/usr/local/bin'

# Support for ccache compiler and icecream.
append2path '/usr/lib/ccache'
export CCACHE_PREFIX=icecc

# Path for Android Tools.
append2path $DEVDIR'/android-sdk/tools'
append2path $DEVDIR'/android-sdk/platform-tools'
append2path $DEVDIR'/android-ndk'
append2path $DEVDIR'/android-ndk/tools'

# Path for Erlang.
append2path '/opt/local/lib/erlang/bin'

# Include user's private bin if it exists.
prepend2path "$HOME/bin"

# Remove path duplicates, keeping first occurrence.
if [ -n $MANPATH ]; then
    export MANPATH=$(echo $MANPATH | awk -F: ' BEGIN { OFS=":"; COLON="no" } { for (i=1;i<=NF;i++) if (arr[$i] != 1) { arr[$i]=1; if (COLON == "yes") printf ":"; else COLON = "yes"; printf $i } } ')
fi

if [ -n $PATH ]; then
    export PATH=$(echo $PATH | awk -F: ' BEGIN { OFS=":"; COLON="no" } { for (i=1;i<=NF;i++) if (arr[$i] != 1) { arr[$i]=1; if (COLON == "yes") printf ":"; else COLON = "yes"; printf $i } } ')
fi

# Configure the Homebrew Python Path. Only needed if using Python bindings to a
# brew-installed library from a NON-brew Python!
# In fact, I think even in the above case this is no longer advised. I read that
# there is a config file you can modify instead.
#export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"

# Set Maven Home variable so it can be seen by IntelliJ and others
export M2_HOME='/opt/local/share/java/maven3'

# Some programs, like git and hg, look for the EDITOR variable.
export EDITOR=vim

# Enabling colorized output for programs which support it
export CLICOLOR=true

# For gnuplot support in Octave.
export GNUTERM=x11

# Adds auto-complete and history keeping to Python interpreter.
export PYTHONSTARTUP=$HOME/.pystartup

# Options for less.
# -R allows me to pump colorized output from grep into less, and maintain the ANSI colour sequences.
# -i gives case-insensitive searches. (Can be toggled when in less, by typing -i.)
LESS=-Ri

# A convenient function for swapping files.
#function swap() { mv $1 $1._tmp; mv $2 $1; mv $1._tmp $2; }

# Various aliases
if [[ "$OSTYPE" == "darwin"* ]]; then
	# OS X ls doesn't have the --color option (and doesn't need it).
	alias ls='ls -h'
else
	alias ls='ls --color=auto -h'
fi
alias l='ls -A'
alias ll='l -l'
alias grep='GREP_COLOR="1;33" LANG=C grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias apt='sudo apt-get'
alias app='apt-cache'
alias aps='apt-cache search --names-only'
alias apl='dpkg -l'
alias gdiff='git diff --no-index'

# Set up aliases to list paths vertically, element by element, rather than
# horizontally across the screen. 
alias path='echo $PATH | tr -s ":" "\n"'
alias manpath='echo $MANPATH | tr -s ":" "\n"'

if command -v keychain >/dev/null 2>&1; then
	eval `keychain --eval id_rsa`
fi

if [ -f $HOME/.localrc ]; then
	source $HOME/.localrc
fi

