# 
# Configuration file to set parameters and packages on the VM produced by Vagrant
# Author: Rafael Gorski (rafaelgorski.com)
#
# Before vagrant up:
#   mkdir cookbooks
#   cd cookbooks
#   git clone https://github.com/librato/nodejs-cookbook.git
#   git clone https://github.com/opscode-cookbooks/build-essential.git
#
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.vm.box = "lucid32"
    config.vm.box_url = "http://files.vagrantup.com/lucid32.box"
    config.vm.hostname = "hubot.local"
    config.vm.network :private_network, ip: "10.0.1.20"

    config.vm.provision :chef_solo do |chef|
      chef.log_level = :debug
      chef.add_recipe "git"
      chef.add_recipe "apt"
      chef.add_recipe "nodejs"
      chef.add_recipe "nodejs::npm"
      chef.add_recipe "coffeescript"
      chef.add_recipe "hubot"
    end

    config.vm.provision :shell, :path => "bash_provisioning.sh"
    config.ssh.max_tries = "50000"
    #config.ssh.timeout = "3000000"
end
