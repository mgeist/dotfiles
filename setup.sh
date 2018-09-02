#!/bin/bash

# install xcode
xcode-select --install
# agree to xcode license
sudo xcodebuild -license accept

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install some apps from brew
brew cask install google-chrome
brew cask install firefox
brew cask install alfred
brew cask install skitch
brew cask install spotify
brew cask install filezilla
brew cask install vlc
brew cask install dropbox
brew cask install 1password
brew cask install slack

# install dev related stuff from brew
brew cask install pgadmin4
brew install neovim
brew install node
brew install python@2
brew install go
brew install heroku-toolbelt
brew cask install iterm2
brew install zsh
brew install direnv
brew install postgresql
brew install fzf
brew install the_silver_searcher
brew install httpie
brew cask install licecap
brew install terraform

# install oh-my-zsh
http https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh > /tmp/install.sh
sed -i.tmp 's:env zsh::g' /tmp/install.sh # we dont want to dip into zsh just yet
sh /tmp/install.sh

mkdir ~/.config
mkdir ~/.config/nvim
# symlink zshrc
ln -sf `pwd`/.zshrc ~/.zshrc
# symlink nvimrc
ln -sf `pwd`/init.vim ~/.config/nvim/init.vim
ln -sf `pwd`/init.vim ~/.vimrc
# symlink zsh theme
ln -sf `pwd`/zsh/dbprompt.zsh-theme ~/.oh-my-zsh/themes/dbprompt.zsh-theme
# symlink zsh aliases
# TODO: split out work specific and personal specific
mkdir ~/zsh
ln -sf `pwd`/zsh/aliases.zsh ~/zsh/aliases.zsh
ln -sf `pwd`/zsh/completions ~/.oh-my-zsh/completions

# zsh plugins
pip install virtualenvwrapper
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

# set up vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# setup python support for neovim
pip install neovim
pip install flake8

# install vim plugins
vim !silent +PlugInstall +qall colorscheme solarized

brew services start postgresql

# git setup
git config --global user.email "matgeist@gmail.com"
git config --global user.name "Mat Geist"
git config --global core.editor nvim

# font setup
brew tap caskroom/fonts
brew cask install font-fira-code

# iterm color setup
curl "https://raw.githubusercontent.com/nathanbuchar/atom-one-dark-terminal/master/scheme/iterm/One%20Dark.itermcolors" > ~/Downloads/OneDark.itermcolors

# go setup
mkdir -p ~/Projects/go

# TODO: alfred/spotlight - can we automate setting the hotkeys?
# TODO: dropbox - can we get my specific version?
# TODO: slack - auto add my specific servers?
# TODO: automate logging into any cli tools ie heroku toolbelt
# TODO: dotfiles - got zsh and vim, are there others?
# TODO: symlink nvimrc to vimrc
# TODO: can we automate alfred, dropbox, 1password setup/config?
# TODO: automate ssh key registration with github? - can be a python script

# disable guest account
sudo defaults write /Library/Preferences/com.apple.AppleFileServer guestAccess -bool NO
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server AllowGuestAccess -bool NO
# "Set Dock to auto-hide and remove the auto-hiding delay? (y/n)"
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
# "Disabling press-and-hold for special keys in favor of key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# Remove all the default icons from dock
defaults write com.apple.dock persistent-apps -array
# Show battery % in bar
defaults write com.apple.menuextra.battery ShowPercent YES
# Show hidden files in finder
defaults write com.apple.finder AppleShowAllFiles YES
# TODO: look into https://gist.github.com/brandonb927/3195465 and related for more tweaks


echo "Post installation tips:"
echo "- Set fira-code font in iterm2"
echo "- Set itermcolor scheme (file is OneDark.itermcolors)"
