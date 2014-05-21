name             'et_console_app'
maintainer       'EverTrue, Inc.'
maintainer_email 'jeff@evertrue.com'
license          'Apache 2.0'
description      'Installs/Configures et_console_app'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '2.1.0'

depends 'yum',     '~> 3.1'
depends 'apt',     '~> 2.3'
depends 'apache2', '~> 1.9'
depends 'selinux', '~> 0.7'
depends 'et_users'
depends 'node',    '~> 1.1'
