#!/usr/bin/env bash

version="0.0.3"

# Apple command-line tools

xcode-select --install

# homebrew

echo "Installing homebrew"
# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

# rvm/ruby

echo "Installing rvm and latest stable ruby..."
\curl -sSL https://get.rvm.io | bash -s stable --ruby

# rails

echo "Installing ruby on rails..."
gem install rails

# cocoapods

echo "Installing cocoapods..."
gem install cocoapods

# cli tools
binaries=(
	git
	python3
	postgres
	heroku-toolbelt
	caskroom/cask/brew-cask
)

echo "Installing binaries..."
brew install $(binaries[@])
brew tap caskroom/versions

# Apps

apps=(
	bittorrent-sync
	dropbox
	flashlight
	firefox
	google-chrome
	hipchat
	instacast
	istat-menus
	kaleidoscope
	parallels-desktop
	skype
	sublime-text3
	tower
	transmission
	vagrant
	vlc
	xscope
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "Installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

brew cleanup

echo "Done"