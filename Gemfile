source "https://rubygems.org"

gem "bootsnap", require: false
gem "csv", "~> 3.3"
gem "devise"
gem "httparty"
gem "importmap-rails"
gem "jbuilder"
gem "nokogiri"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "rails", "~> 7.2.2", ">= 7.2.2.1"
gem "sidekiq"
gem "rswag-api"
gem "rswag-ui"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[ windows jruby ]

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "ffaker"
  gem "rubocop-rails-omakase", require: false
  gem "rspec-rails", "~> 7.0.0"
  gem "rswag-specs"
end

group :development do
  gem "letter_opener"
  gem "letter_opener_web"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
end
