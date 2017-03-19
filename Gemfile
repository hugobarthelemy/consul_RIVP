source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.0.2'
# Use PostgreSQL
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Fix sprockets on the
gem 'sprockets'

gem 'devise'
gem 'devise_security_extension'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'

gem 'kaminari'
gem 'ancestry'
gem 'acts-as-taggable-on'
gem 'responders'
gem 'foundation-rails'
gem 'foundation_rails_helper'
gem 'acts_as_votable'
gem 'ckeditor'
gem 'invisible_captcha'
gem 'cancancan'
gem 'social-share-button'
gem 'initialjs-rails'
gem 'unicorn'
gem 'paranoia'
gem 'rinku', require: 'rails_rinku'
gem 'savon'
gem 'dalli'
gem 'rollbar'
gem 'delayed_job_active_record'
gem 'daemons'
gem 'devise-async'
gem 'newrelic_rpm'
gem 'whenever', require: false
gem 'pg_search'
gem 'sitemap_generator'

gem 'ahoy_matey'
gem 'groupdate' # group temporary data
gem 'tolk' # Web interface for translations

gem 'browser'
gem 'turnout'
gem 'redcarpet'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'fuubar'
  gem 'launchy'
  gem 'quiet_assets'
  gem 'letter_opener_web'
  gem 'i18n-tasks'
  gem 'axlsx' # for export i18n tag missing with i18n-tasks
  gem 'capistrano',          require: false
  gem 'capistrano-bundler',  require: false
  gem "capistrano-rails",     require: false
  gem 'rvm1-capistrano3',              require: false
  gem 'capistrano3-delayed-job'
  gem "bullet"
  gem "faker"
  gem 'rubocop' , require: false
  gem 'knapsack'
end

group :test do
  gem 'database_cleaner'
  gem 'poltergeist'
  gem 'coveralls', require: false
  gem 'email_spec'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console'
end

eval_gemfile './Gemfile_custom'
