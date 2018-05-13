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
    @devices = Device.find(params[:id])
    erb :'devices/edit'
  end

  post "/devices/:id" do
    redirect_if_not_logged_in
    @device = Device.find(params[:id])
    unless Device.valid_params?(params)
      redirect "/devices/#{@device.id}/edit?error=invalid device"
    end
    @device.update(params.select{|k|k=="name" || k=="company"})

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
    @device = Device.create(:name => params["name"], :company => params["company"])
    @device.save    
    redirect "/devices"
  end

end
