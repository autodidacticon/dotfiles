#!/bin/bash
sudo hostname yolomac
scutil --set HostName yolomac

cd ~
mkdir git
cd git
#install Xcode CLT
xcode-select --install

# install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# clone dotfiles
git clone https://github.com/autodidacticon/dotfiles.git

# install 'brew bundle'
brew update
brew tap homebrew/bundle

# install stuff
cd ~/git/dotfiles/host-yolomac
brew bundle -v

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# install dotfiles
rcup -d $HOME/git/dotfiles -B `hostname -s` -x README.md -x Brewfile -x mac.sh
