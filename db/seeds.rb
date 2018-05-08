ps4 = Platform.create(:name => "Playstation 4")
gc = Platform.create(:name => "GameCube")

@spyro = Game.create(:name => "Spyro")
@spyro.platform_ids = ps4.id 