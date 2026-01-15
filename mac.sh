#!/bin/bash
# macos provisioning script
# prerequisites: hostname folder must exist as host-$HOSTNAME
# usage: mac.sh hostname

HOSTNAME=$1

# Set the user-friendly name (Finder/AirDrop)
sudo scutil --set ComputerName "$HOSTNAME"

# Set the local Bonjour name (no spaces allowed)
sudo scutil --set LocalHostName "$HOSTNAME"

# Set the terminal/SSH hostname
sudo scutil --set HostName "$HOSTNAME"

cd ~
mkdir git
cd git
#install Xcode CLT
xcode-select --install

# install Homebrew
if ! brew --version &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
brew update

# clone dotfiles
if [ ! -d ~/git/dotfiles ]; then
    git clone https://github.com/autodidacticon/dotfiles.git
fi

# install stuff
cd ~/git/dotfiles/host-`hostname`
brew bundle -v

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# install dotfiles
rcup -d $HOME/git/dotfiles -B `hostname` -x Brewfile
