class AddUserIdToPlatforms < ActiveRecord::Migration[5.1]
  def change
    add_column :devices, :user_id, :integer
  end
end