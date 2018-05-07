class PlatformsController < ApplicationController


  get '/platforms' do
    @platforms = Platform.all
    erb :'platforms/index'
  end

  get '/platforms/:slug' do
    @platforms = Platform.find_by_slug(params[:slug])
    erb :'platforms/show'
  end
end