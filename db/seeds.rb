@user = User.create(:username => "user1", :password_digest => "1")
@user2 = User.create(:username => "user2", :password_digest => "2")

ps4 = Device.create(:name => "Playstation 4", :company => "Sony", :user_id => @user.id)
gc = Device.create(:name => "GameCube", :company => "Nintendo", :user_id => @user2.id)

@spyro = Game.create(:name => "Spyro", :device_id => ps4.id, :players => 1, )
@mk = Game.create(:name => "Mario", :device_id => gc.id, :players => 4)
