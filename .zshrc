# Some stuff for zsh even without oh-my-zsh
setopt extendedglob notify
unsetopt beep
bindkey -e
bindkey ";5D" backward-word
bindkey ";5C" forward-word
bindkey '^j' backward-kill-line
bindkey '^d' kill-word

zstyle :compinstall filename '/home/ntraft/.zshrc'
autoload -Uz compinit
compinit

# Apparently need this here for oh-my-zsh to use the correct python.
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git mercurial svn brew osx sublime macports pip python virtualenv virtualenvwrapper)

if [ -d $ZSH ]; then
	source $ZSH/oh-my-zsh.sh
fi

#######################################
# User configuration
#######################################

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Don't show variable names instead of directory names.
# This needs to be EXACTLY here after sourcing oh-my-zsh but before sourcing
# .profile: because oh-my-zsh turns it on but we don't want it to create dir
# names in the below call.
unsetopt autonamedirs

# This needs to be here; even though oh-my-zsh RUNS this file, it does not SOURCE it.
source $HOME/.profile
