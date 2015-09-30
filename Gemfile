source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '4.2.4'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'devise'
gem 'foundation-rails'
gem 'pry-rails'
gem 'faker'
gem 'kaminari'
gem 'fog'
gem 'fog-aws'
gem 'dotenv-rails'
gem 'figaro'


group :development, :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'launchy'
  gem 'factory_girl'
  gem 'valid_attribute'
  gem 'shoulda-matchers', require: false
end

group :test do
  gem 'coveralls', require: false
  gem 'poltergeist'
  gem 'database_cleaner'
end

group :production do
  gem 'rails_12factor'
end

group :development, :test, :production do
  gem 'carrierwave'
end
