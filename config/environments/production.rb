require "active_support/core_ext/integer/time"

Rails.application.configure do

  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.compile = true

  config.hosts << "www.simple-no-smoking.com"
  config.active_storage.service = :local
  config.log_level = :info
  config.assets.debug = false
  host = 'simple-no-smoking.herokuapp.com'
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_caching = false
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_url_options = { host: host }
  config.action_mailer.smtp_settings = {
    address:              'smtp.sendgrid.net',
    user_name:            'apikey',
    password:             ENV['SENDGRID_API_KEY'],
    authentication:       :plain,
    domain:               'herokuapp.com',
    port:                 '587',
    enable_starttls_auto: true,
  }
  
  config.log_tags = [ :request_id ]
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.active_support.disallowed_deprecation = :log
  config.active_support.disallowed_deprecation_warnings = []
  config.log_formatter = ::Logger::Formatter.new
  
  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  config.active_record.dump_schema_after_migration = false
end
