source 'https://rubygems.org'

ruby '2.5.1'

group :production do
  gem 'unicorn', '5.4.1'
end


git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
  
group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'capistrano'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano3-unicorn'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

# gem 'turbolinks', '~> 5'
  # git_source(:github) do |repo_name|
  #  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  #  "https://github.com/#{repo_name}.git"
# end
gem 'rails', '~> 5.0.7', '>= 5.0.7.2'
gem 'mysql2', '>= 0.3.18', '< 0.6.0'
gem 'puma', '~> 4.3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.5'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'haml-rails'
gem 'font-awesome-sass'
gem 'devise'
gem 'carrierwave'
gem 'mini_magick'
gem 'fog-aws'
gem 'pry-rails'
gem 'payjp'
gem 'dotenv-rails'
gem 'gon'
gem 'jp_prefecture'
gem 'ancestry'
gem 'active_hash'