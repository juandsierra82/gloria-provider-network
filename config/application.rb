require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GloriaProviderNetwork
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.middleware.insert_before 0, "Rack::Cors", :debug => true, :logger => (-> { Rails.logger }) do
      allow do
        origins 'http://localhost:4200', 'http://104.236.104.176', 'https://toolbelt.kaufmanrossin.com'
        resource '*',
          :headers => :any,
          :methods => [:get, :post, :delete, :put, :options, :head, :patch],
          :max_age => 0,
          :credentials => true
      end
    end
    config.autoload_paths += %W(#{config.root}/lib)
    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
