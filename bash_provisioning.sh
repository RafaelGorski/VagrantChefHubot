#!/usr/bin/env bash
#
# Provisioning using bash for vagrant.
# Update the apt repositories and fetch and install skype and dependencies
# For dev proposals vim and vim bundles are available
# Node Libraries availables: node-oracle
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

# fontconfig needed to render X11
sudo apt-get install -y fontconfig-config;

# Skype connector for Hubot
sudo apt-get install -y python-setuptools;
sudo easy_install Skype4Py;

#npm install -g hubot-skype
git clone https://github.com/netpro2k/hubot-skype.git;
cp hubot-skype/src/* /usr/local/lib/node_modules/hubot/src/adapters;
cp -rf hubot-skype/ /usr/local/lib/node_modules/hubot/node_modules;
# TODO: remove hubot-skype

# install hubot scripts
#git clone https://github.com/github/hubot-scripts.git;
#mv hubot-scripts/src/scripts/* /usr/local/lib/node_modules/hubot/src/scripts;
# TODO: remove hubot-scripts

#navigation helper
ln -s /usr/local/lib/node_modules/hubot;

# command from hubot to create your own hubot name, botbot for instace
echo 'bin/hubot --create ../botbot' > usr/local/lib/node_modules/create-own-hubot; 

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
echo 'export PATH=$PATH:/opt/instantclient/' >> /etc/profile;

sudo npm install -g node-gyp;
sudo npm install -g db-oracle;

# installing package hubot-script dependecies
#sudo npm install -g xml2js;
#sudo npm install -g redis;
#sudo npm install -g scraper;
#sudo npm install -g soupselect;
#sudo npm install -g htmlparser;
#sudo npm install -g jsdom;
#sudo npm install -g underscore;
#sudo npm install -g phantom;
#sudo npm install -g cheerio;
#sudo npm install -g sprintf;
#sudo npm install -g bang;
#sudo npm install -g shellwords;
#sudo npm install -g moment;
#sudo npm install -g twit;
#sudo npm install -g githubot;
#sudo npm install -g ntwitter;
#sudo npm install -g sandbox;
#sudo npm install -g cradle;
#sudo npm install -g request;
#sudo npm install -g chess;
#sudo npm install -g yelp;
#sudo npm install -g date-utils; 
#sudo npm install -g tumblrbot; 
#sudo npm install -g hubucket;
#sudo npm install -g mongodb;
#sudo npm install -g wolfram;
#sudo npm install -g gitio;
#sudo npm install -g scribe-node;
#sudo npm install -g prowler;
#sudo npm install -g underscore.string;
#sudo npm install -g oauth;
#sudo npm install -g nodepie;
#sudo npm install -g pypi;
#sudo npm install -g validator;
#sudo npm install -g handlebars;
#sudo npm install -g big-integer;
#sudo npm install -g node-xmpp;
#sudo npm install -g domain;
#sudo npm install -g aws2js;
#sudo npm install -g sh;
#sudo npm install -g xml2json;

