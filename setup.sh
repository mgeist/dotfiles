#!/bin/bash

# install xcode
xcode-select --install
# agree to xcode license
sudo xcodebuild -license accept

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install some apps from brew
brew cask install google-chrome
brew cask install firefoxdeveloperedition
brew cask install alfred
brew cash install skitch
brew cask install spotify
brew cask install filezilla
brew cask install vlc
brew cask install dropbox
brew cask install 1password
brew cask install slack

# install dev related stuff from brew
brew cask install atom
brew install neovim
brew install node
brew install python
brew install go --cross-compile-common # install golang w/ compiling cross os/architectures
brew install heroku-toolbelt
brew cask install iterm2
brew install zsh
brew install postgresql # TODO: verify this functions and doesnt need any additional setup
# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# symlink zshrc
ln -sf `pwd`/.zshrc ~/.zshrc
# symlink nvimrc
ln -sf `pwd`/init.vim ~/.config/nvim/init.vim
# set up vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

brew services start postgresql

# git setup
git config --global user.email "matgeist@gmail.com"
git config --global user.name "Mat Geist"
git config --global core.editor nvim

# TODO: alfred/spotlight - can we automate setting the hotkeys?
# TODO: dropbox - can we get my specific version?
# TODO: slack - auto add my specific servers?
# TODO: automate logging into any cli tools ie heroku toolbelt
# TODO: dotfiles - got zsh and vim, are there others?
# TODO: symlink nvimrc to vimrc
# TODO: run nvim :PlugInstall (and vim)
# TODO: atom package setup
# TODO: can we automate alfred, dropbox, 1password setup/config?
# TODO: automate ssh key registration with github? - can be a python script

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
# TODO: dock speedup / animation removal amongst others. refer to work zshrc
