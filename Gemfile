source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# a pure ruby implementation of the RFC 7519 OAuth JSON Web Token (JWT) standard.
gem 'jwt'
# ActiveModel::Serializer implementation and Rails hooks.
gem 'active_model_serializers', '~> 0.10.0'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # rspec-rails is a testing framework for Rails 3.x, 4.x e 5.0.
  gem 'rspec-rails', '~> 3.5'
end

group :test do
  # a library for setting up Ruby objects as test data.
  gem 'factory_girl_rails', '~> 4.0'
  # shoulda-matcher provides Rspec and Minitest compatible one liners that test common Rails functionality.
  gem 'shoulda-matchers', '~> 3.1'
  # a library for generating fake data.
  gem 'faker'
  # strategies for cleaning database in Ruby.
  gem 'database_cleaner'
  # an IRB alternative and runtime developer console.
  gem 'pry'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
