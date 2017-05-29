ruby '2.4.1'
source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails',          '~> 5.1.1'
gem 'pg',             '~> 0.20'
gem 'puma',           '~> 3.7'

gem 'bootstrap-sass', '~> 3.3.7'
gem 'coffee-rails',   '~> 4.2'
gem 'haml',           '~> 5.0.1'
gem 'jbuilder',       '~> 2.5'
gem 'jquery-rails',   '~> 4.3.1'
gem 'jquery-ui-rails','~> 6.0.1'
gem 'sass-rails',     '~> 5.0'
gem 'sprockets-es6',  '~> 0.9.2' # Used for ECMA2015 with React
gem 'turbolinks',     '~> 5'
gem 'uglifier',       '>= 1.3.0'

# Utility and design pattern enhancing gems
gem 'verbalize',      '~> 2.0'

# Front end enhancements
gem 'chart-js-rails', '~> 0.1'
gem 'react-rails',    '~> 2.2'


group :development, :test do
  gem 'rspec-rails',      '~> 3.5'

  gem 'byebug', platform: :mri
  gem 'pry',        '~> 0.10.4'
  gem 'pry-rails',  '~> 0.3.4'
  gem 'pry-byebug', '~> 3.4'

  gem 'clipboard',  '~> 1.1.1'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen',      '~> 3.0.5', '< 3.2'

  gem 'capistrano',         '3.6.1'
  gem 'capistrano3-puma'
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
end
