name             'drupal'
maintainer       'James Walker'
maintainer_email 'walkah@walkah.net'
license          'Apache 2.0'
description      'Installs/Configures Drupal'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports "debian"
supports "ubuntu"

depends "apache2",            "~> 1.8.14"
depends "apt",                "~> 2.3.4"
depends "build-essential",    "~> 1.4.2"
depends "drush"
depends "git",                "~> 2.9.0"
depends "mysql",              "~> 4.0.20"
depends "php",                "~> 1.3.12"