source "https://rubygems.org"

gem "rack"
gem "grape", :git => "https://github.com/intridea/grape.git"
gem "json"
gem "newrelic_rpm"
gem "newrelic-grape"
gem "pony"
# gem "mongoid"
# gem "bson_ext"
# gem "redis"

group :development do
  gem "rake"
  gem "guard"
  gem "guard-bundler"
  gem "guard-rack"
  gem "guard-rspec"
  gem "guard-shell"
  gem "ruby_gntp"
end

group :test do
  gem "rspec"
  gem "rack-test"
  gem "json_spec"
  gem "email_spec"
  gem "capybara"
  # gem "database_cleaner"
end

group :development, :test do
  gem "fdoc"
  gem "simplecov"
  gem "factory_girl"
  gem "faker"
end
