source 'https://rubygems.org'

gem 'dotenv-rails', group: :development
gem 'rails', '4.0.1'
gem 'chosen-rails'
gem 'thin'
gem 'coveralls', require: false
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'omniauth-mapmyfitness-oauth2', :github => "jcasimir/omniauth-mapmyfitness-oauth2"
gem 'mapmyfitness', :github => "billy22g/mapmyfitness"
gem 'faraday'
gem 'faker'
gem 'resque'
gem 'resque_mailer'
gem 'haml-rails'
gem 'jquery-rails'
gem 'sass-rails'
gem 'whenever', :require => false

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :assets do
  gem 'normalize-rails'
  gem 'coffee-rails'
  gem 'underscore-rails'
  gem 'uglifier'
end

group :development, :test do
  gem 'capybara'
  gem 'rspec-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'sqlite3'
  gem 'shoulda-matchers'
  gem 'pry'
end

group :test do
  gem 'database_cleaner'
  gem 'launchy'
  gem 'factory_girl_rails'
  gem 'simplecov', :require => false
end
