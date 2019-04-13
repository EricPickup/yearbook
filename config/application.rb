require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Yearbook
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.middleware.use OmniAuth::Builder do
      provider :google_oauth2, '46281716787-5jfh8nvo413qkge6gm2p5rd03rsrpc6e.apps.googleusercontent.com', 'ec9ZO-yN2hhEVd6kNeSNuCdK', { hd: 'uwindsor.ca', prompt: 'none' }
    end
  end
end
