#
# Author:: Rafael Gorski ( rafael@adaptlean.com.br) 
# Cookbook Name:: hubot 
# Recipe:: default
#
# Copyright 20122, AdaptLean.com.br 
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

bash "install hubot using npm" do
  cwd "/usr/local/src"
  user "root"
  code <<-EOH
    npm install hubot
  EOH
end
