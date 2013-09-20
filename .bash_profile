# Color the prompt
export PS1="\[$(tput setaf 2)\]\u@\h:\[$(tput setaf 5)\]\w \[$(tput sgr0)\]$ "

# Allow globs to expand hidden files
shopt -s dotglob nullglob

source ~/.profile
