source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "2.5.1"

gem "bootsnap", require: false
gem "coffee-rails"
gem "figaro"
gem "jbuilder"
gem "mysql2"
gem "puma"
gem "rails"
gem "rubocop", "~> 0.54.0", require: false
gem "sass-rails"
gem "turbolinks"
gem "uglifier"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "chromedriver-helper"
  gem "selenium-webdriver"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
