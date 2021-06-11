source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.1"

gem "rails"
gem "pg"
gem "puma"

gem "jbuilder"
gem "rexml" # required by activesupport. It's a bundled gem in ruby > 3

gem "sass-rails"
gem "hotwire-rails"
gem "tailwindcss-rails"
gem "image_processing"
gem "ruby-vips"

gem "bootsnap", require: false

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "listen"
  gem "spring"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
