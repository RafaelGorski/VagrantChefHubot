# Before vagrant up:
#   mkdir cookbooks
#   cd cookbooks
#   git clone https://github.com/librato/nodejs-cookbook.git
#   git clone https://github.com/opscode-cookbooks/build-essential.git
# TODO:
#   setup PORT variable
#   setup $PATH  
#   define if need REDIS or NOT
#   install extra pkg https://github.com/github/hubot-scripts.git
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.vm.box = "precise32"
    config.vm.box_url = "http://files.vagrantup.com/precise32.box"
    #config.vm.network :hostonly, "10.11.12.13"
    #config.vm.host_name = "solari"

    config.vm.provision :chef_solo do |chef|
      chef.log_level = :debug
      chef.add_recipe "git"
      chef.add_recipe "nodejs"
      chef.add_recipe "nodejs::npm"
      chef.add_recipe "coffeescript"

    end

    config.ssh.max_tries = "50000"
    #config.ssh.timeout = "3000000"
end
