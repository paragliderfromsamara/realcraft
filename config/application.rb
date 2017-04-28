require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RealCraftCom
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.i18n.default_locale = :en
    config.i18n.available_locales = [:ru, :en]
    
    config.action_mailer.delivery_method = :smtp

    config.action_mailer.smtp_settings = {
      :address              => "smtp.yandex.ru",
      :port                 => 587,
      :domain               => 'realcraftboats.com',
      :user_name            => ENV["RC_APP_MAIL_LOGIN"],
      :password             => ENV["RC_APP_MAIL_PSWRD"], 
      :authentication       => 'plain',
      :enable_starttls_auto => true   }
  end
end
