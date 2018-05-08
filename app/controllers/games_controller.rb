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

  get "/games/:id/edit" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @game = Game.find(params[:id])
    erb :'games/edit'
  end

  post "/games/:id" do
    redirect_if_not_logged_in
    @game = Game.find_by_slug(params[:slug])
    unless Game.valid_params?(params)
      redirect "/games/#{@game.id}/edit?error=invalid game"
    end
    @game.update(params.select{|k|k=="name" || k=="device_id"})
    redirect "/clubs/#{@club.id}"
  end

  get '/games/:id' do
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
