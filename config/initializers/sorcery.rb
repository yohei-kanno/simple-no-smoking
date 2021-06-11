# The first thing you need to configure is which modules you need in your app.
# The default is nothing which will include only core features (password encryption, login/logout).
#
# Available submodules are: :user_activation, :http_basic_auth, :remember_me,
# :reset_password, :session_timeout, :brute_force_protection, :activity_logging,
# :magic_login, :external
Rails.application.config.sorcery.submodules = [:reset_password, :user_activation, :remember_me, :external]

Rails.application.config.sorcery.configure do |config|
  config.user_config do |user|
    user.stretches = 1 if Rails.env.test?
    user.reset_password_mailer = UserMailer
    user.user_activation_mailer = UserMailer
    user.reset_password_time_between_emails
    user.remember_me_for = 1209600
    user.authentications_class = Authentication
    
  end
  config.external_providers = [:twitter]
  config.twitter.key = ENV['TWITTER_API_KEY']
  config.twitter.secret = ENV['TWITTER_SECRET_API_KEY']
  config.twitter.user_info_path = "/1.1/account/verify_credentials.json?include_email=true"
  config.twitter.callback_url = 'http://127.0.0.1:3000/oauth/callback?provider=twitter'
  config.twitter.user_info_mapping = {
    id: 'uid',
    name: 'name',
    email: 'email'
  }
  config.user_class = "User"
end
