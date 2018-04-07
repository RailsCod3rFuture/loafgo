source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'active_link_to'
gem 'bootstrap', '~> 4.0.0.beta'
gem 'bootstrap4-datetime-picker-rails'
gem 'carrierwave'
gem 'chartkick'
gem 'chosen-rails'
gem 'city-state'
gem 'cocoon'
gem 'country_state_select', git: 'git://github.com/arvindvyas/Country-State-Select', branch: :master
gem 'curl'
gem 'devise'
gem 'emd'
gem 'font-awesome-rails'
gem 'friendly_id'
gem 'geocoder'
gem 'grape'
gem 'grape-jsonapi-resources'
gem 'grape-kaminari', :github => 'joshmn/grape-kaminari'
gem 'grape_on_rails_routes'
gem 'groupdate'
gem 'inline_svg'
gem 'invoice_printer'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'kaminari'
gem 'mini_magick'
gem 'omniauth'
gem 'paper_trail'
gem 'phony'
gem 'phony_rails'
gem 'rack-cors'
gem 'rails-timeago'
gem 'rails_emoji_picker'
gem 'ransack'
gem 'redcarpet'
gem 'remotipart'
gem 'scss_lint', require: false
gem 'simple_form'
gem 'simple_token_authentication', github: 'gonzalo-bulnes/simple_token_authentication', branch: 'spike-add-grape-support-3'
gem 'split', require: 'split/dashboard'
gem 'spring', group: :development
gem 'spring-watcher-listen', group: :development

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7', platforms: :ruby
gem 'bcrypt', git: 'https://github.com/codahale/bcrypt-ruby.git', require: 'bcrypt'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'factory_bot_rails', '~> 4.0'
  gem 'faker'
  gem 'guard-rspec'
  gem 'rspec-rails', '~> 3.7'
end

group :test do
  gem 'capybara', '~> 2.13'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
end
group :development do
  gem 'better_errors'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
