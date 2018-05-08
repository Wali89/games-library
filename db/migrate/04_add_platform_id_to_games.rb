class AddPlatformsIdGames < ActiveRecord::Migration
  def change
    add_column :golf_clubs, :golf_bag_id, :integer
  end
end