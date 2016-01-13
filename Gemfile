source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'

# Use sqlite3 as the database for Active Record for the development & test environments

# gem 'sqlite3', group: [:test, :development, :vagrant_production]

# Use postgres as the database for Active Record for the production environment
gem 'pg',       group: :production

# Use rails_12factor for logging & static assets
gem 'rails_12factor', group: :production

# Use dpl for deployment from Travis (only needed to not trigger installation in Travis CI environment)
gem 'dpl', group: :production

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
#gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Bootstrap for styling views
gem "bootstrap-sass", "~> 3.3"

# Use Font Awesome for enhanced styling
gem "font-awesome-rails", "~> 4.2"

# Use Simple form for enhaced styling of forms
gem "simple_form", "3.1.0"

# Use Device for authentication features
gem "devise", "~> 3.4.1"

# Use Pundit for authorization & permisions features
gem "pundit", "~> 0.3.0"

# Use CarrierWave for file uploading funtionality
gem "carrierwave", "~> 0.10.0"

# Use Fog for uploading to AWS's S3
gem 'fog'

# Use Searcher for searching functionality
gem "searcher", github: "radar/searcher"

gem 'figaro'

gem 'rvm-capistrano'

# Use Capistrano for handling deployments to servers (non-Heroku)
gem 'capistrano', '~> 2.15.5'

gem 'sprockets', '~> 2.11.3'

gem 'puma'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem "rspec-rails", "~> 3.1.0"
end

group :test do
    gem "capybara", "~> 2.4"
    gem "factory_girl_rails", "~> 4.5"
    gem "selenium-webdriver", "~> 2.48.0"
    gem "chromedriver-helper", "~> 1.0.0"
    gem "database_cleaner", "~> 1.4.0"
    gem "color", "~> 1.4.1"
    gem "email_spec", "~> 1.6.0"
end

