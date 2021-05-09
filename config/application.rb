require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module SimpleNoSmoking
  class Application < Rails::Application
    config.action_controller.include_all_helpers = false
    config.load_defaults 6.1
    config.time_zone = 'Tokyo'
    config.i18n.load_path +=
      Dir[Rails.root.join("config","locales","**","*.{rb,yml}").to_s]
    config.autoload_paths += Dir["#{config.root}/lib"]  # 追加
    config.eager_load_paths += Dir["#{config.root}/lib/**/"]  # 追加
    
    config.i18n.default_locale = :ja
  end
end
