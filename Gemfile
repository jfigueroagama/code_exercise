source 'https://rubygems.org'

ruby '2.3.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails',          '5.0.1'
# Use postgresql as the database for Active Record
gem 'pg',             '0.18.4'
# Use Puma as the app server
gem 'puma',           '3.6.2'
# Use SCSS for stylesheets
gem 'sass-rails',     '5.0.6'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier',       '3.0.4'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails',   '4.2.1'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails',   '4.2.2'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder',       '2.6.1'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Rails integration with bower
gem 'bower-rails',    '0.11.0'
# Use of Moment.js
gem 'momentjs-rails', '2.17.1'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # Adding pry for debugging
  gem 'pry',          '0.10.4'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console',  '3.4.0'
  gem 'listen',       '3.0.8'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
