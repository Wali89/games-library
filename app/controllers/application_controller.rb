require './config/environment'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "gamesaregreat"
  end

  get '/' do 
    erb :index
  end

  helpers do
    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/login?error=You have to be logged in to do that"
      end
    end

    def logged_in?
      !!session[:user_id]
    end

    def login(un)
      if user = User.find_by(:username => un)
        session[:username] = user.username
      else
        redirect '/login'
      end
    end

    def current_user
      User.find(session[:user_id])
    end

    def logout!
      session.clear
    end
  end
end