source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use postgres as the database for Active Record
gem 'pg', group: [:development, :production]
# Use SqLite as the database for Active Record in test stage
gem 'sqlite3', group: :test
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

gem "will_paginate"
gem 'will_paginate-materialize'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use gravatar avatar system
gem 'gravatar_image_tag', '~> 1.2'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# User for rendering
gem 'responders', '~> 2.1'

gem 'escape'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Display database structure
  gem 'annotate', '~> 2.6.10'

  # Rspec testing
  gem 'rspec', '~> 3.3.0'
  gem 'rspec-rails', '~> 3.3.0'

  # Factory instances
  gem 'factory_girl_rails', '4.5.0'

  gem 'railroady'

end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  #Capistrano Suite
  gem 'capistrano', '~> 3.4.0'
  gem 'capistrano-rails', '~> 1.1.5'
  gem 'capistrano-rbenv', '~> 2.0.3'
  gem 'capistrano-passenger'


  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
