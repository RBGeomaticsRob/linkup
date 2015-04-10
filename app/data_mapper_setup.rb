env = ENV['RACK_ENV'] || 'development'

# DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")
require './app/models/link' # needs to be done after setup hence the placing
require './app/models/user'
require './app/models/tag'
DataMapper.finalize
