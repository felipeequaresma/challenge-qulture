source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'
gem 'rails', '~> 6.0.4', '>= 6.0.4.4'

gem 'pg', '>= 0.18', '< 2.0'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'graphiql-rails', '~> 1.8'
gem 'graphql', '~> 1.13'
gem 'puma', '~> 4.1'
gem 'rack-cors'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'pry'
  # gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'rubocop-rails', '~> 2.13'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
