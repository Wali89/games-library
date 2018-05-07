class GamesController < ApplicationController


  get '/games' do
    @games = Game.all
    erb :'games/index'
  end

  get '/games/:slug' do
    @game = Game.find_by_slug(params[:slug])
    erb :'games/show'
  end

  get '/games/new' do
    erb :'/games/new'
  end

  post '/games' do
    @game = Game.create(:name => params["Name"])
    @game.platform_ids = params[:platforms]
    @game.save

    redirect("/games/#{@game.slug}")
  end

end