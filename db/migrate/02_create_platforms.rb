class CreatePlatforms < ActiveRecord::Migration[5.1]

  def change
    create_table :platforms do |t|
      t.string :name
      t.string :company
    end
  end
end
