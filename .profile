# Prepend the MacPorts path so as to override built-ins.  Man should be able to
# find the corresponding manpath automatically.
export PATH='/opt/local/bin:/opt/local/sbin':$PATH
#export MANPATH=$MANPATH:/opt/local/share/man

# Also prepend python install scripts.
export PATH='/usr/local/share/python':$PATH

# Prepend the Homebrew path so as to override built-ins.
export PATH='/usr/local/bin':$PATH

# Setting the path for XCode Dev Tools.  Man should be able to find the 
# corresponding manpath automatically.
export PATH=$PATH:'/Developer/Tools:/Developer/usr/bin:/Developer/usr/sbin'
#export MANPATH=$MANPATH:/Developer/usr/share/man

# Setting the path for Android Tools.
export PATH=$PATH:'/Developer/SDKs/android-sdk/tools:/Developer/SDKs/android-sdk/platform-tools'
export PATH=$PATH:'/Developer/SDKs/android-ndk:/Developer/SDKs/android-ndk/tools'

# Setting the path for Flex SDK command-line tools.
export PATH=$PATH:'/Applications/Adobe Flex Builder 3/sdks/3.2.0/bin'

# Setting the path for Erlang
export PATH=$PATH:'/opt/local/lib/erlang/bin'

# Set Maven Home variable so it can be seen by IntelliJ and others
export M2_HOME='/opt/local/share/java/maven3'

# Adding EDITOR variable for TextMate 10/05/2009
export EDITOR='mate -w'

# Enabling colorized output for programs which support it
export CLICOLOR=true

# Color the prompt
export PS1="\[$(tput setaf 2)\]\u@\h:\[$(tput setaf 5)\]\w \[$(tput sgr0)\]$ "

# Various aliases
alias ls='ls -h'
alias l='ls -hA'
alias ll='ls -lhA'
alias grep='GREP_COLOR="1;33" LANG=C grep --color=auto'

# For Python virtualenvwrapper
source /usr/local/share/python/virtualenvwrapper.sh
