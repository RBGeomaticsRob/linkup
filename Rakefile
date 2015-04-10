require 'cucumber/rake/task'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'data_mapper'
require './app/models/link' # needs to be done after setup hence the placing
require './app/models/user'
require './app/models/tag'
require './app/data_mapper_setup'

RuboCop::RakeTask.new :cop
RSpec::Core::RakeTask.new :spec
Cucumber::Rake::Task.new :cuke

task default: [:cop, :spec, :cuke]

task :auto_upgrade do
  DataMapper.setup(:default, "postgres://localhost/bookmark_manager_test")
  DataMapper.finalize
  DataMapper.auto_upgrade!
  puts 'Auto-upgrade complete (no data loss)'
end

task :auto_migrate do
  DataMapper.setup(:default, "postgres://localhost/bookmark_manager_test")
  DataMapper.finalize
  DataMapper.auto_migrate!
  puts 'Auto-upgrade complete (data could have been lost)'
end