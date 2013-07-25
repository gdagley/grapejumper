ENV['RACK_ENV'] ||= :development

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rubygems'
require 'bundler/setup'

Bundler.require :default, ENV['RACK_ENV']

%w{models services}.each do |folder|
  Dir[File.expand_path("../../app/#{folder}/*.rb", __FILE__)].each do |f|
    require f
  end
end

require 'api'
