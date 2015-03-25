#
# Cookbook Name:: drupal
# Attributes:: default
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

default['drupal']['project_name'] = 'drupal'
default['drupal']['docroot'] = '/var/www/drupal'
default['drupal']['apache_port'] = 8080
default['drupal']['database'] = 'drupal'

case node['platform']
when 'ubuntu'
  if node['platform_version'].to_f >= 12.10
    default['build-essential']['compile_time'] = true
    default['php']['xdebug']['version'] = '2.3.2'
    default['php']['ext_conf_dir'] = '/etc/php5/mods-available'
  else
    default['php']['xdebug']['version'] = '2.2.7'
    default['php']['ext_conf_dir']  = '/etc/php5/conf.d'
  end
end
