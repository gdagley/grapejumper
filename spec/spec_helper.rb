require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
  add_filter '/config/'

  add_group 'Services', 'app/services'
  add_group 'Models', 'app/models'
end if ENV["COVERAGE"]

ENV["RACK_ENV"] ||= 'test'

require File.expand_path("../../config/application", __FILE__)

Fdoc.service_path = File.expand_path(File.dirname(__FILE__) + "/fdoc")

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include JsonSpec::Helpers
  config.include EmailSpec::Helpers
  config.include EmailSpec::Matchers

  config.mock_with :rspec
  config.expect_with :rspec

  # config.before(:suite) do
  #   DatabaseCleaner.strategy = :truncation
  # end

  # config.before(:each) do
  #   DatabaseCleaner.start
  # end

  # config.after(:each) do
  #   DatabaseCleaner.clean
  # end
end
