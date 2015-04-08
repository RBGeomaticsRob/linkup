class BookmarkManager < Sinatra::Base

  post '/links' do
    tags = params['tags'].split(' ').map do |tag|
      Tag.first_or_create(text: tag)
    end
    url = params['url']
    title = params['title']
    Link.create(url: url, title: title, tags: tags)
    redirect to('/')
  end

end