# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew)

source $ZSH/oh-my-zsh.sh

sudo () { ( unset LD_LIBRARY_PATH DYLD_LIBRARY_PATH; exec command sudo $* ) }
# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH
export PIP_DOWNLOAD_CACHE=$HOME/.pip_download_cache

# Axiom virtualenvwrapper config
export WORKON_HOME=/opt/.virtualenvs/
. /usr/local/bin/virtualenvwrapper.sh

export TOMCAT_HOME=/usr/local/Cellar/tomcat/7.0.37/libexec

#export DYLD_LIBRARY_PATH="/usr/local/oracle/instantclient_11_2"
#export PATH=$PATH:$DYLD_LIBRARY_PATH
export SQLPATH="/usr/local/oracle/instantclient_11_2"
export TNS_ADMIN="/usr/local/oracle/network/admin"
export NLS_LANG="AMERICAN_AMERICA.UTF8"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#case $- in *i*)
#    if [ -z "$TMUX" ]; then exec tmux; fi;;
#esac
