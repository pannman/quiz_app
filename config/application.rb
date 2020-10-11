require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module QuizApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.generators do |g|
      g.test_framework :rspec,
            view_specs: true,
            helper_specs: true,
            controller_specs: true,
            routing_specs: true
    end

  end

  private

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(AdminUser)
      admin_root_path
    else
      root_path
    end
  end

  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin_admin_user
      new_admin_admin_user_session_path
    else
      new_user_session_path
    end
  end
end
