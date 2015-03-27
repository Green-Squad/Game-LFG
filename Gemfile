source 'https://rubygems.org'

gem 'activeadmin', github: 'activeadmin'

gem 'bundler'
gem 'devise'
gem 'jbuilder'
gem 'pg'
gem 'rails', '~> 4.2.0'
gem 'tzinfo-data'
gem 'validates_formatting_of'

group :development do
  gem 'spring'
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end

group :production do
  gem 'exception_handler'
  gem 'whenever'
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end