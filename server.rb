require 'sinatra/base'
require 'data_mapper'
require 'tag'
require 'link'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")
require './lib/link' # needs to be done after setup hence the placing
DataMapper.finalize
DataMapper.auto_upgrade!

class BookmarkManager < Sinatra::Base

  get '/' do
    @links = Link.all
    erb :index
  end

  post '/links' do
    tags = params['tags'].split(' ').map do |tag|
      Tag.first_or_create(text: tag)
    end
    url = params['url']
    title = params['title']
    Link.create(url: url, title: title, tags: tags)
    redirect to('/')
  end
  run! if app_file == $PROGRAM_NAME
end
