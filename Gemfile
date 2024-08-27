# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.3.4'
gem 'bootsnap', require: false
gem 'devise_token_auth', '~> 1.2'
gem 'jbuilder', '~> 2.11'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rack-cors', '~> 2.0'
gem 'rails', '~> 7.1.3', '>= 7.1.3.4'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker', '~> 3.2'
  gem 'rspec-rails', '~> 6.0'
  gem 'rubocop-factory_bot', '~> 2.26', '>= 2.26.1'
  gem 'rubocop-rails'
  gem 'rubocop-rspec', '~> 3.0', '>= 3.0.4'
  gem 'rubocop-rspec_rails', '~> 2.30'
  gem 'simplecov_json_formatter', '~> 0.1.4', require: false
end

group :development do
  gem 'letter_opener', '~> 1.8'
end

group :test do
  gem 'database_cleaner-active_record', '~> 2.1'
  gem 'shoulda-matchers', '~> 5.3'
  gem 'simplecov', '~> 0.22.0', require: false
end
