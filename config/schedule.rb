ENV['RAILS_ENV'] || :production

require File.expand_path(File.dirname(__FILE__) + "/environment")

set :output, "#{Rails.root}/log/crontab.log"
set :job_template, "/bin/zsh -l -c ':job'"
job_type :rake, "export PATH=\"$HOME/.rbenv/bin:$PATH\"; eval \"$(rbenv init -)\"; cd :path && RAILS_ENV=:environment bundle exec rake :task :output"
set :environment, ENV['RAILS_ENV']

every 1.minute do
  command "heroku run rails reset_reduction:reduction"
end