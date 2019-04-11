#!/bin/bash
sudo hostname -s autodidacticon
cd ~
mkdir git
cd git
#install Xcode CLT
xcode-select --install

# install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install 'brew bundle'
brew update
brew tap homebrew/bundle
brew install hub
brew install lastpass-cli --with-pinentry
git config --global hub.protocol https
hub clone autodidacticon/dotfiles

# install stuff
cd ~/git/dotfiles/host-autodidacticon
brew bundle -v

#install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#get dotfiles
rcup -d $HOME/git/dotfiles -B `hostname -s` -x README.md
