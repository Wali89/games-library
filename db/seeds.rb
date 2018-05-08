@user = User.create(:username => "test", :password_digest => "1234")

ps4 = Device.create(:name => "Playstation 4", :company => "Sony")
gc = Device.create(:name => "GameCube", :company => "Nintendo")

@spyro = Game.create(:name => "Spyro", :device_id => ps4.id, :players => 1)
@mk = Game.create(:name => "Mario", :device_id => gc.id, :players => 4)
