class GamesController < ApplicationController


  get '/games' do
    redirect_if_not_logged_in
    @games = Game.all
    erb :'games/index'
  end

  get '/games/new' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    erb :'/games/new'
  end

  get "/clubs/:id/edit" do
    redirect_if_not_logged_in 
    @error_message = params[:error]
    @club = GolfClub.find(params[:id])
    erb :'golf_clubs/edit'
  end

  
  get '/games/:slug' do
    @game = Game.find_by_slug(params[:slug])
    erb :'games/show'
  end

  post '/games' do
    if logged_in?
      if params[] == ""
        redirect
        @game = Game.create(:name => params["Name"])
        @game.platform_ids = params[:platforms]
        @game.save

        redirect("/games/#{@game.slug}")
      end
  end
end





end