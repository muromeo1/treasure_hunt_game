require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
# require "action_mailbox/engine"
require 'action_view/railtie'
require 'rails/test_unit/railtie'

Bundler.require(*Rails.groups)

module TreasureHuntGame
  class Application < Rails::Application
    config.load_defaults 6.1
    config.autoload_paths << Rails.root.join('lib')
    config.api_only = true
  end
end
