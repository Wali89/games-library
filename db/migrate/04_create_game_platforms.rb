class CreateGamePlatforms < ActiveRecord::Migration[5.1]

  def change
    create_table :game_platforms do |t|
      t.integer :platform_id
      t.integer :game_id
    end
  end
end
