require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  register Sinatra::Partial
  set :partial_template_engine, :erb
  enable :sessions
  set :session_secret, 'super secret'
  use Rack::Flash
  use Rack::MethodOverride
  DataMapper::Logger.new($stdout, :debug)
  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id]) if session[:user_id]
    end
  end
  require './app/controllers/homepage'
  require './app/controllers/links'
  require './app/controllers/sessions'
  require './app/controllers/tags'
  require './app/controllers/users'
  run! if app_file == $PROGRAM_NAME

end

# require './app/models/link' # needs to be done after setup hence the placing
# require './app/models/user'
# require './app/models/tag'


