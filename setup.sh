#!/bin/bash

# install xcode
xcode-select --install
# agree to xcode license
sudo xcodebuild -license accept

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install some apps from brew
brew cask qnstall google-chrome
brew cask install alfred
brew cash install skitch
brew cask install spotify
brew cask install filezilla
brew cask install vlc
brew cask install dropbox
brew cask install 1password
brew cask install atom
brew cask install slack

# install dev related stuff from brew
brew install node
brew install python
brew install go --cross-compile-common # install golang w/ compiling cross os/architectures
brew install heroku-toolbelt
brew cask install iterm2
brew install zsh
brew install postgresql # TODO: verify this functions and doesnt need any additional setup
# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

brew services start postgresql

git config --global user.email "matgeist@gmail.com"
git config --global user.name "Mat Geist"

# TODO: dotfiles
# TODO: atom package setup
# TODO: zshrc
# TODO: can we automate alfred, dropbox, 1password setup/config?
# TODO: automate ssh key registration with github?

#  Atom Packages
# ex-mode
# linter
# linter-eslint
# set-syntax
# language-javascript-jsx
# vim-mode-plus

# disable guest account
defaults write /Library/Preferences/com.apple.AppleFileServer guestAccess -bool NO
defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server AllowGuestAccess -bool NO
