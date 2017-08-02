source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails',            '~> 5.0.2'
gem 'bootstrap-sass',    '3.3.6'
gem 'seed_dump'
gem 'puma',             '~> 3.0'
gem 'sass-rails',       '~> 5.0'
gem 'uglifier',         '>= 1.3.0'
gem 'faker', '~> 1.7', '>= 1.7.3'
gem 'coffee-rails',     '~> 4.2'
gem 'semantic-ui-sass', '~> 2.2'
gem 'jquery-rails'
gem 'turbolinks',       '~> 5'
gem 'jbuilder',         '~> 2.5'


group :development, :test do
  gem 'byebug', platform: :mri
  gem 'sqlite3'
end

group :development do
  gem 'web-console',            '>= 3.3.0'
  gem 'listen',                 '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen',  '~> 2.0.0'
  gem 'letter_opener'
end

group :production do
  gem 'pg', '~> 0.20.0'
end
