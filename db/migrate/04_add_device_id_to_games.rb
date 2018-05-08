class AddDeviceIdToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :device_id, :integer
  end
end