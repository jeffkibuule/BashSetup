#!/usr/bin/env bash

version="0.0.4"

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
brew upgrade

# rvm/ruby

echo "Installing rvm and latest stable ruby..."
\curl -sSL https://get.rvm.io | bash -s stable --ruby

# rails

echo "Installing ruby on rails (skipping docs)..."
gem install rails --no-ri --no-rdoc

# cocoapods

echo "Installing cocoapods..."
gem install cocoapods

# cli tools
binaries=(
    git
    bash-completion
    heroku-toolbelt
    postgresql
	python3
	ssh-copy-id
	caskroom/cask/brew-cask
)

echo "Installing binaries..."
brew install $(binaries[@])
brew tap caskroom/versions

# Apps

apps=(
    adobe-creative-cloud
	bittorrent-sync
	dropbox
	firefox
	google-chrome
	hipchat
	instacast
	istat-menus
	kaleidoscope
    parallels-desktop
    postgres
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