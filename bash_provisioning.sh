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
sudo apt-get install -y unzip;
unzip /tmp/shared_folder/instantclient-basic-linux.x64-11.2.0.3.0.zip -d /opt/instantclient;
unzip /tmp/shared_folder/instantclient-sdk-linux.x64-11.2.0.3.0.zip -d /opt/instantclient;
unzip /tmp/shared_folder/instantclient-sqlplus-linux.x64-11.2.0.3.0.zip -d /opt/instantclient;
sudo mv /opt/instantclient/instantclient_11_2/* /opt/instantclient;

sudo ln -s /opt/instantclient/libocci.so.11.1 /opt/instantclient/libocci.so;
sudo ln -s /opt/instantclient/libclntsh.so.11.1 /opt/instantclient/libclntsh.so;

sudo apt-get install -y libaio1;
echo 'export OCI_INCLUDE_DIR=/opt/instantclient/sdk/include/' >> /etc/profile;
echo 'export OCI_LIB_DIR=/opt/instantclient' >> /etc/profile;
echo 'export LD_LIBRARY_PATH=/opt/instantclient' >> /etc/profile;
echo 'export NODE_PATH=/usr/local/lib/node_modules' >> /etc/profile;

sudo npm install -g node-gyp;
sudo npm install -g db-oracle;

#git clone https://github.com/nearinfinity/node-oracle.git;
#npm install node-oracle;

