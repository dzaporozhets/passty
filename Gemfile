source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.0.2'

# Supported DBs
gem "mysql2", group: :mysql
gem "pg", group: :postgres
gem 'sqlite3', group: :sqlite
# Use HAML for templates
gem 'haml-rails', '~> 0.4'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0.rc1'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'


# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.0.1'

# App web server
gem 'puma'

# Auth
gem 'devise', '~> 3.0.0'

gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem "font-awesome-sass-rails", "~> 3.0.0"
gem 'bootstrap-sass'

# Pagination
gem 'kaminari'
gem 'kaminari-bootstrap'

gem 'yaml_db', github: 'jetthoughts/yaml_db', ref: 'fb4b6bd7e12de3cffa93e0a298a1e5253d7e92ba'
group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'thin'
end

group :development, :test do
  gem 'annotate'
  gem 'factory_girl_rails'
  gem 'spork', '~> 1.0rc'
  gem 'poltergeist'
  gem "ffaker"
  gem 'coveralls', require: false
  gem 'guard-rspec'
  gem 'pry'
  gem 'capybara', '~> 2.1.0'
  gem 'rspec-rails', '~> 2.13'
  gem 'shoulda-matchers'
end


# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use Capistrano for deployment
# gem 'capistrano', group: :development
