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
    @game = Game.find(params[:id])
    @error_message = params[:error]
    if @game = current_user.games.find_by(params[:id])
    erb :'games/edit'
    else
      redirect '/games'
    end
  end

  post "/games/:id" do
    redirect_if_not_logged_in
    @game = Game.find(params[:id])
    unless Game.valid_params?(params)
      redirect "/games/#{@game.id}/edit?error=invalid game"
    end
    @game.update(params.select{|k|k=="name" || k=="device_id" || k=="players"})
    redirect "/games/#{@game.id}"
  end

  get '/games/:id' do
    redirect_if_not_logged_in
    @game = Game.find(params[:id])
    erb :'games/show'
  end

  post '/games' do
    redirect_if_not_logged_in
    unless Game.valid_params?(params)
      redirect "/games/new?error=invalid game"
    end
    @game = Game.create(:name => params["name"], :players => params["players"], :device_id => params["device_id"])
    @game.save
    redirect "/games"
  end

end
