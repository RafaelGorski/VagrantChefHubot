#!/usr/bin/env bash
#
# Provisioning using bash for vagrant.
# Update the apt repositories and fetch and install skype
#
# Author: Rafael Gorski ( @GorskiRafael |  rafaelgorski.com )
# References
# https://help.ubuntu.com/community/Skype

# Skype
sudo apt-get install -y python-software-properties
sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner";
sudo apt-get update;
sudo apt-get install -y skype;

# Skype connector for Hubot
sudo apt-get install -y python-setuptools;
sudo easy_install Skype4Py;
npm install -g hubot-skype
