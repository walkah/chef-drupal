require_recipe "apt"
require_recipe "apache2"
require_recipe "apache2::mod_php5"
require_recipe "mysql::server"
require_recipe "php::package"
require_recipe "php::module_gd"
require_recipe "php::module_mysql"
require_recipe "drush"

node[:hosts].each do |site|
  web_app site do
    server_name site
    server_aliases ["*.#{site}"]
    docroot "/vagrant/public/#{site}"
  end
end
