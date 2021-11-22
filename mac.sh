#!/bin/bash
# macos provisioning script
# prerequisites: hostname folder must exist as host-$HOSTNAME
# usage: mac.sh hostname

HOSTNAME=$1
sudo hostname $HOSTNAME
scutil --set HostName $HOSTNAME

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
cd ~/git/dotfiles/host-`hostname`
brew bundle -v

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# install dotfiles
rcup -d $HOME/git/dotfiles -B `hostname -s` -x Brewfile
