require 'chefspec'
require 'chefspec/berkshelf'
require 'chefspec/server'

RSpec.configure do |config|
  config.log_level = :fatal
end

ChefSpec::Server.create_client('et_console_app_spec', admin: true)
