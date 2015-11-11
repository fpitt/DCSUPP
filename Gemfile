source 'http://rubygems.org'

ruby "2.1.5"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

#Glyphs-rails gem
gem 'webhostinghub-glyphs-rails'

# Use Unicorn as the app server
#gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

#FB_auth
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'

#No strong parameter on user now, so, this will have to do
gem 'protected_attributes'

#certified gem for SSL regarding FB auth
gem 'certified'

#meta-tag gem
gem 'meta-tags'

#pagination!
gem 'kaminari'

#sanitization!
gem 'sanitize'

#WYSIWYG + file upload
gem 'ckeditor'
gem 'carrierwave'
gem 'mini_magick'

#production gems for Heroku, especially pg
group :production do
  gem 'pg',             '0.17.1'
  gem 'rails_12factor', '0.0.2'
end

gem 'mandrill-api'

gem 'bootstrap-sass', '~> 3.3.5'
#gem 'autoprefixer-rails', '~> 4.0.2.2'

gem 'jquery-turbolinks'
gem 'cancan'
gem 'mail'

gem "twitter-bootstrap-rails"
gem 'slim-rails', '~> 3.0.1'
gem 'angular-rails-templates'

# downgrade. upgrade to v3 when templates is compatible
gem 'sprockets', '~> 2.12.3'

gem 'coffee-script-source', '1.8.0'

gem "paperclip", "~> 4.3"