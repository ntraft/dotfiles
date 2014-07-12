#!/usr/bin/env zsh

# If brew isn't installed install it
if [ ! -e "$(which brew)" ]; then
	ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
fi

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade


function install() {
	# Attempt install, ignore already installed errors
	brew install "${@}"
}

install hg
install git


# Install native apps

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
brew tap phinze/homebrew-cask
brew install brew-cask

function installcask() {
	brew cask install "${@}"
}

# installcask the-unarchiver
# installcask alfred
# installcask app-cleaner
# installcask intellij-ultimate
# installcask istat-menus
# installcask sublime-text
# installcask google-chrome
installcask transmission
installcask dropbox
# installcask evernote
installcask vlc
installcask skype
installcask firefox

# Remove outdate versions from the cellar
brew cleanup
