#
# Cookbook Name:: drupal
# Recipe:: _base
#
# Copyright (C) 2014 James Walker
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'build-essential'
include_recipe 'php::package'
include_recipe 'php::module_mysql'
include_recipe 'php::module_apc'
include_recipe 'php::module_curl'
include_recipe 'php::module_gd'
include_recipe 'apache2'
include_recipe 'apache2::mod_expires'
include_recipe 'apache2::mod_php5'
include_recipe 'apache2::mod_rewrite'
include_recipe 'nginx::default'
include_recipe 'git'
include_recipe 'drush'

%w(curl htop php5-gmp unzip).each do |pkg|
  package pkg
end

php_pear 'uploadprogress' do
  action :install
end

php_pear 'xdebug' do
  zend_extensions ['xdebug.so']
  version node['php']['xdebug']['version']
  action :install
end

template '/etc/php5/conf.d/xdebug.ini' do
  source 'xdebug.ini.erb'
  owner 'root'
  group 'root'
  mode 0644
end

php_pear 'xhprof' do
  preferred_state 'beta'
  action :install
end

web_app node['drupal']['project_name'] do
  template 'web_app.conf.erb'
  listen_port node['drupal']['apache_port']
  server_name node['drupal']['project_name']
  server_aliases [node['drupal']['project_name']]
  docroot node['drupal']['docroot']
  notifies :restart, 'service[apache2]'
end

template "#{node['nginx']['dir']}/sites-available/#{node['drupal']['project_name']}" do
  source 'nginx_site.conf.erb'
  mode 0644
  owner 'root'
  group 'root'
  notifies :reload, 'service[nginx]'
end

nginx_site node['drupal']['project_name']
