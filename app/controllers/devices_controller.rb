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

  get '/devices/:slug' do
    @devices = device.find_by_slug(params[:slug])
    erb :'devices/show'
  end
end