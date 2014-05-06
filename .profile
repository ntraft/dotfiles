# Prepend the MacPorts path so as to override built-ins.  Man should be able to
# find the corresponding manpath automatically.
export PATH='/opt/local/bin:/opt/local/sbin':$PATH
#export MANPATH=$MANPATH:/opt/local/share/man

# Prepend the Homebrew path so as to override built-ins.
export PATH='/usr/local/bin':$PATH

# Setting the path for Android Tools.
export PATH=$PATH:'/Users/ntraft/Development/android-sdk/tools:/Users/ntraft/Development/android-sdk/platform-tools'
export PATH=$PATH:'/Users/ntraft/Development/android-ndk:/Users/ntraft/Development/android-ndk/tools'

# Setting the path for Erlang
export PATH=$PATH:'/opt/local/lib/erlang/bin'

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

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

