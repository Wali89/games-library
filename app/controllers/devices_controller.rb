class DevicesController < ApplicationController

  get '/devices' do
    redirect_if_not_logged_in
    @devices = Device.all
    erb :'devices/index'
  end

  get "/devices/new" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    erb :'devices/new'
  end

  get "/devices/:id/edit" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @device = Device.find(params[:id])
    if current_user.id == @device.id
      erb :'devices/edit'
    else
      redirect '/devices'
    end
  end

  post "/devices/:id" do
    redirect_if_not_logged_in
    @device = Device.find(params[:id])
    unless Device.valid_params?(params)
      redirect "/devices/#{@device.id}/edit?error=invalid device"
    end
    @device.update(params.select{|k|k=="name" || k=="company"})
    redirect "/devices/#{@device.id}"
  end

  get "/devices/:id" do
    redirect_if_not_logged_in
    @device = Device.find(params[:id])
    erb :'devices/show'
  end

  post "/devices" do
    redirect_if_not_logged_in

    unless Device.valid_params?(params)
      redirect "/devices/new?error=invalid device"
    end
    @device = Device.create(:name => params["name"], :company => params["company"], :user_id => current_user.id)
    @device.save    
    redirect "/devices"
  end

  get "/devices/:id/delete" do
    redirect_if_not_logged_in
    @device = Device.find(params[:id])
    @device.games.each do |game|
      game.delete
    end
    @device.delete
    redirect "/devices"
  end

end
