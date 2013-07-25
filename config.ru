require File.expand_path('../config/application', __FILE__)

if ENV['RACK_ENV'] == 'development'
  puts "Loading NewRelic in developer mode ..."
  require 'new_relic/rack/developer_mode'
  use NewRelic::Rack::DeveloperMode
end

NewRelic::Agent.manual_start

run GrapeJumper::API.new
