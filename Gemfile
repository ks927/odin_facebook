source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails',            '~> 5.0.2'
gem 'carrierwave',             '1.1.0'
gem 'mini_magick',             '4.7.0'
gem 'fog',                     '1.40.0'
gem 'bootstrap-sass',    '3.3.6'
gem 'seed_dump'
gem 'puma',             '~> 3.0'
gem 'sass-rails',       '~> 5.0'
gem 'uglifier',         '>= 1.3.0'
gem 'faker', '~> 1.7', '>= 1.7.3'
gem 'devise'
gem 'pg',               '~> 0.18'
gem "paperclip",        "~> 5.0.0"
gem 'aws-sdk',          '~> 2.3.0'
gem 'coffee-rails',     '~> 4.2'
gem 'semantic-ui-sass', '~> 2.2'
gem 'jquery-rails',      '4.3.1'
gem 'turbolinks',       '~> 5'
gem 'jbuilder',         '~> 2.5'
gem 'omniauth-facebook'
gem 'figaro'

group :development, :test do
  gem 'byebug', platform: :mri
  #gem 'pg'
end

group :development do
  gem 'web-console',            '>= 3.3.0'
  gem 'listen',                 '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen',  '~> 2.0.0'
  gem 'letter_opener'
end

group :test do
  gem 'rails-controller-testing', '0.1.1'
  gem 'minitest-reporters',       '1.1.9'
  gem 'guard',                    '2.13.0'
  gem 'guard-minitest',           '2.4.4'
end

group :production do
  gem 'rails_12factor', '0.0.2'
end