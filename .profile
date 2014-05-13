# Provides functions for adding items to PATH.
source $HOME/.add2path

# MacPorts paths.
prepend2path '/opt/local/bin'
prepend2path '/opt/local/sbin'
# Man should be able to find the corresponding manpath automatically.
#export MANPATH=$MANPATH:/opt/local/share/man

# Homebrew path. 
prepend2path '/usr/local/bin'

# Path for Android Tools.
append2path '/Users/ntraft/Development/android-sdk/tools'
append2path '/Users/ntraft/Development/android-sdk/platform-tools'
append2path '/Users/ntraft/Development/android-ndk'
append2path '/Users/ntraft/Development/android-ndk/tools'

# Path for Erlang.
append2path '/opt/local/lib/erlang/bin'

# Include user's private bin if it exists.
prepend2path "$HOME/bin"

# Configure the Homebrew Python Path. Only needed if using Python bindings to a
# brew-installed library from a NON-brew Python!
#export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"

# Set Maven Home variable so it can be seen by IntelliJ and others
export M2_HOME='/opt/local/share/java/maven3'

# Some programs, like git and hg, look for the EDITOR variable.
export EDITOR='vim'

# Enabling colorized output for programs which support it
export CLICOLOR=true

# For gnuplot support in Octave.
export GNUTERM=x11

# Various aliases
alias ls='ls --color=auto -h'
alias l='ls --color=auto -hA'
alias ll='ls --color=auto -lhA'
alias grep='GREP_COLOR="1;33" LANG=C grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias apt='sudo apt-get'
alias app='sudo apt-cache'
alias aps='apt-cache search --names-only'
alias apl='dpkg -l'

if [ -f $HOME/.localrc ]; then
	source $HOME/.localrc
fi

