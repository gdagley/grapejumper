require 'bundler'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

desc "Show help menu"
task :help do
  puts "Available rake tasks: "
  puts "rake docs - generate API docs"
  puts "rake spec - run Rspec tests"
  puts "rake coverage - generate Rspec coverage report"
end

task :default => :help

desc "Generate API docs"
task :docs do
  puts "removing old docs"
  system("rm -rf docs/*")
  system("fdoc convert . --output=doc/api") or exit!(1)
  system("fdoc convert . --output=doc/api --format=markdown") or exit!(1)
end

require 'rspec/core'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

desc "Create Rspec coverage report"
task :coverage do
  ENV['COVERAGE'] = 'true'
  Rake::Task["spec"].execute
  app_root = Rake.application.original_dir
  output_file = File.join(app_root, 'coverage', 'index.html')
  `open #{output_file}`
end
