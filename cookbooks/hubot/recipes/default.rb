#
# Author:: Rafael Gorski  
# Cookbook Name:: hubot 
# Recipe:: default
#

bash "install hubot using npm" do
  cwd "/usr/local/src"
  user "root"
  code <<-EOH
    npm install hubot
  EOH
end
