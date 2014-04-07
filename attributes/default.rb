set['apache']['listen_ports'] = %w(8080)
set['apache']['contact'] = 'devops@evertrue.com'

set['et_console_app']['deploy_to'] = '/var/www/console.evertrue.com'
set['et_console_app']['docroot'] = "#{node['et_console_app']['deploy_to']}/current/release"

domain_prefix = ''
domain_prefix = "#{node.chef_environment}-" if node.chef_environment != 'prod'
domain_prefix = 'stage' if node.chef_environment == 'stage-newvpc'

set['et_console_app']['server_name'] = "#{domain_prefix}console.evertrue.com"
set['et_console_app']['server_aliases'] = ["#{domain_prefix}dashboard.evertrue.com"]

set['et_web_app']['deploy_to'] = '/var/www/web.evertrue.com'
set['et_web_app']['docroot'] = "#{node['et_web_app']['deploy_to']}/current/release"

set['et_web_app']['server_name'] = "#{domain_prefix}web.evertrue.com"

# Set Apache modules to enable
set['apache']['default_modules'] = %w(
  status
  alias
  auth_basic
  authn_file
  authz_default
  authz_groupfile
  authz_host
  authz_user
  dir
  env
  mime
  setenvif
  deflate
  expires
  headers
  rewrite
)

# mod_status Allow list, space separated list of allowed entries
set['apache']['status_allow_list'] = '127.0.0.1 localhost ip6-localhost'
# Set ExtendedStatus to true to supply MeetMe New Relic plugin w/ metrics
set['apache']['ext_status'] = true
