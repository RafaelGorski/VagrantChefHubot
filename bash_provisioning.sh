#!/usr/bin/env bash
#
# Provisioning using bash for vagrant.
# Update the apt repositories and fetch and install skype and dependencies
# For dev proposals vim and vim bundles are available
#
# Author: Rafael Gorski ( @GorskiRafael |  rafaelgorski.com )
# References:
# https://help.ubuntu.com/community/Skype

# Skype
sudo apt-get install -y python-software-properties;
sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner";
sudo apt-get update;
sudo apt-get install -y skype;
sudo apt-get install -y curl;

# Skype connector for Hubot
sudo apt-get install -y python-setuptools;
sudo easy_install Skype4Py;

#npm install -g hubot-skype
git clone https://github.com/netpro2k/hubot-skype.git;
cp hubot-skype/src/* /usr/local/lib/node_modules/hubot/src/adapters;
cp -rf hubot-skype/ /usr/local/lib/node_modules/hubot/node_modules;

#navigation helper
ln -s /usr/local/lib/node_modules/hubot;

#vim
sudo apt-get install -y vim;

# Vim package manager using phantongen
mkdir -p .vim/autoload .vim/bundle;
curl -Sso .vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim;

#tpope vim sensible
git clone git://github.com/tpope/vim-sensible.git .vim/bundle/vim-sensible;

# coffeescript vim plugin
git clone https://github.com/kchmck/vim-coffee-script.git .vim/bundle/vim-coffee-script/

# vimrc
echo "execute pathogen#infect()" >> .vimrc;
echo "syntax on" >> .vimrc;
echo "filetype plugin indent on" >> .vimrc;

# Oracle OCI Installation
# https://github.com/mariano/node-db-oracle
sudo apt-get install alien;
sudo alien -i oracle-instantclient11.2-basic-11.2.0.3.0-1.x86_64.rpm;
sudo alien -i oracle-instantclient11.2-sqlplus-11.2.0.3.0-1.x86_64.rpm;
sudo alien -i oracle-instantclient11.2-devel-11.2.0.3.0-1.x86_64.rpm;
sudo apt-get install libaio;
export OCI_INCLUDE_DIR=/opt/instantclient/sdk/include/;
export OCI_LIB_DIR=/opt/instantclient;
npm install db-oracle;
export LD_LIBRARY_PATH=/opt/instantclient;

