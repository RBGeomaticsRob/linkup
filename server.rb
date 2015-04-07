require 'sinatra/base'
require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")
require './lib/link' # needs to be done after setup hence the placing
DataMapper.finalize
DataMapper.auto_upgrade!

class BookmarkManger < Sinatra::Base
  run! if app_file == $PROGRAM_NAME
end
