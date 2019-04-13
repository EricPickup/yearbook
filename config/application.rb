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
      provider :google_oauth2, '157630002807-n0q3bmea7dmq5s4fbnt3fuvigfhjaj24.apps.googleusercontent.com', '2hVQxd9W3Dj1J3AB4J_sPwQr', { hd: 'uwindsor.ca' }
    end
  end
end
