source "https://rubygems.org"

ruby "2.3.1"

gem "autoprefixer-rails"
gem "aws-sdk", "~> 2.3"
gem "country_select"
gem "delayed_job_active_record"
gem "devise"
gem "flutie"
gem "high_voltage"
gem "jquery-rails"
gem "kaminari"
gem "bootstrap-kaminari-views"
gem "normalize-rails", "~> 3.0.0"
gem "paperclip", "~> 5.0.0"
gem "pg"
gem "puma"
gem "rack-canonical-host"
gem "rails", "~> 5.0.0"
gem "rails-timeago", "~> 2.0"
gem "rails_admin"
gem "recipient_interceptor"
gem "redcarpet"
gem "sass-rails", "~> 5.0"
gem "bootstrap-sass", "~> 3.3.6"
gem "bootstrap_form"
gem "devise-bootstrap-views"
gem "slim-rails"
gem "sprockets", ">= 3.0.0"
gem "sprockets-es6"
gem "suspenders"
gem "title"
gem "uglifier"

group :development do
  gem "listen"
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console"
end

group :development, :test do
  gem "awesome_print"
  gem "bullet"
  gem "bundler-audit", ">= 0.5.0", require: false
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "ffaker"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.5.0.beta4"
  gem "rails-controller-testing"
end

group :development, :staging do
  gem "rack-mini-profiler", require: false
end

group :test do
  gem "capybara-webkit"
  gem "database_cleaner"
  gem "formulaic"
  gem "launchy"
  gem "shoulda-matchers"
  gem "simplecov", require: false
  gem "timecop"
  gem "webmock"
end

group :staging, :production do
  gem "rack-timeout"
  gem "rails_stdout_logging"
end
