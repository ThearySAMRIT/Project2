source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "bootstrap-sass", "~> 3.3", ">= 3.3.7"
gem "bootstrap-will_paginate", "~> 0.0.10"
gem "bcrypt", "~> 3.1", ">= 3.1.11"
gem "carrierwave", "~> 0.11.2"
gem "mini_magick", "~> 4.5", ">= 4.5.1"
gem "fog", "~> 1.38"
gem "config", "~> 1.4"
gem "devise", "~> 4.2"
gem "faker", "~> 1.6", ">= 1.6.3"
gem "jquery-rails", "~> 4.3", ">= 4.3.1"
gem "rails", "~> 5.1.2"
gem "puma", "~> 3.7"
gem "recaptcha", "~> 4.3", ">= 4.3.1", require: "recaptcha/rails"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "will_paginate", "~> 3.1", ">= 3.1.6"
gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
  gem "rspec"
  gem "rspec-rails"
  gem "rspec-collection_matchers"
  gem "factory_girl_rails"
  gem "better_errors"
  gem "guard-rspec", require: false
  gem "database_cleaner"
  gem "brakeman", require: false
  gem "jshint"
  gem "bundler-audit"
  gem "rubocop", "~> 0.35.0", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "scss_lint", require: false
  gem "scss_lint_reporter_checkstyle", require: false
  gem "eslint-rails", git: "https://github.com/octoberstorm/eslint-rails"
  gem "rails_best_practices"
  gem "reek"
  gem "railroady"
  gem "autoprefixer-rails"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "simplecov", require: false
  gem "simplecov-rcov", require: false
  gem "simplecov-json"
  gem "shoulda-matchers", "< 3.0.0", require: false
end

group :production do
  gem "pg", "0.20.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
