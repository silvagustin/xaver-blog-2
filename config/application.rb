require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module XaverBlog2
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Where the I18n library should search for translation files
		config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**','*.{rb,yml}')]
		#ES LO MISMO QUE    I18n.load_path += Dir[Rails.root.join('config', 'locales', '**','*.{rb,yml}')]

		# Whitelist locales available for the application
	  config.i18n.available_locales = %i(es en)
	  #config.i18n.available_locales = %i(es en)

    # Set default locale to something other than :en
    config.i18n.default_locale = :es

    #Faker::Config.locale = :es
  end
end
