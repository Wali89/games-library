
#Users
@mc = User.create(:username => "masterchief", :password_digest => "mc")

@mario = User.create(:username => "mario", :password_digest => "m")

@kratos = User.create(:username => "kratos", :password_digest => "k")

#Devices
ps4 = Device.create(:name => "Playstation 4", :company => "Sony", :user_id => @kratos.id)

ps3 = Device.create(:name => "Playstation 3", :company => "Sony", :user_id => @kratos.id)

gc = Device.create(:name => "GameCube", :company => "Nintendo", :user_id => @mario.id)

n64 = Device.create(:name => "Nintendo 64", :company => "Nintendo", :user_id => @mario.id)

xbox360 = Device.create(:name => "X-Box 360", :company => "Microsoft", :user_id => @mc.id)
xbox1 = Device.create(:name => "X-Box 1", :company => "Microsoft", :user_id => @mc.id)


#Games
@spyro = Game.create(:name => "Spyro", :device_id => ps4.id, :players => 2)
@gow = Game.create(:name => "God Of War 3", :device_id => ps3.id, :players => 1)

@mk = Game.create(:name => "Mario Kart", :device_id => gc.id, :players => 4)
@mp = Game.create(:name => "Mario Party", :device_id => n64.id, :players => 4)


@halo = Game.create(:name => "Halo", :device_id => xbox360.id, :players => 4)
@minecraft = Game.create(:name => "Mine Craft", :device_id => xbox360.id, :players => 1)
