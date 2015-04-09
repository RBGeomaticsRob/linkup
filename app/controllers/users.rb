require_relative '../lib/token'
class BookmarkManager < Sinatra::Base

  get '/users/new' do
    @user = User.new
    erb :"../views/users/new"
  end

  post '/users' do
    @user = User.new(email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation],
                     token: nil,
                     timestamp: nil)
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'../views/users/new'
    end
  end

  get '/users/forgotten' do
    erb :'../views/users/forgotten'
  end

  get '/users/reset/:token' do
    @user = User.first(token: params[:token])
    if @user.timestamp > Time.now - 3600
      erb :reset
    else
      flash[:errors] = ['Token has expired, please request another']
      redirect '/users/forgotten'
    end
  end

end
