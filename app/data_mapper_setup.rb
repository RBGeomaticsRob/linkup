env = ENV['RACK_ENV'] || 'development'

# DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")
DataMapper.finalize
