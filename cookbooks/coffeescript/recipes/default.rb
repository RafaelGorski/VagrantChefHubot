#
# Author:: Rafael Gorski ( rafaelgorski.com.br) 
# Cookbook Name:: coffeescript 
# Recipe:: default
#
bash "install coffeescript using npm" do
  cwd "/usr/local/src"
  user "root"
  code <<-EOH
   npm install -g coffee-script 
  EOH
end
