#!/bin/bash
cd ~
#install Xcode CLT
xcode-select --install

# install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install 'brew bundle'
brew update
brew tap homebrew/bundle
brew install hub
brew install lastpass-cli --with-pinentry
hub clone autodidacticon/dotfiles

# install stuff
cd ~/git/dotfiles/host-butlerianjihad
brew bundle -v

#install oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

#get dotfiles
rcup -d $HOME/git/dotfiles -B `hostname -s` -x README.md
