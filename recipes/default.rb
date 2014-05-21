#
# Cookbook Name:: et_console_app
# Recipe:: default
#
# Copyright (C) 2014 EverTrue, Inc.
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

case node['platform_family']
when 'debian'
  include_recipe 'apt'
  package 'fontconfig'
end

package 'git'

include_recipe 'node'
include_recipe 'et_users::evertrue'
include_recipe 'apache2'

[
  node['et_console_app']['deploy_to'],
  node['et_web_app']['deploy_to'],
  node['et_app_app']['deploy_to']
].each do |deploy_to_dir|
  directory deploy_to_dir do
    owner 'deploy'
    group node['apache']['group']
    mode '2775'
  end
end

# Install some excellent Apache config rules, courtesy of h5bp.com
cookbook_file "#{node['apache']['dir']}/conf.d/h5bp.conf" do
  source 'h5bp.conf'
  mode '0644'
  owner 'root'
  group node['apache']['root_group']
  action :create_if_missing
end

web_app 'console' do
  server_name node['et_console_app']['server_name']
  server_aliases node['et_console_app']['server_aliases']
  docroot node['et_console_app']['docroot']
end

web_app 'web' do
  server_name node['et_web_app']['server_name']
  docroot node['et_web_app']['docroot']
end

web_app 'app' do
  server_name node['et_app_app']['server_name']
  docroot node['et_app_app']['docroot']
end
