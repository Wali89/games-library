class CreateDevices < ActiveRecord::Migration[5.1]

  def change
    create_table :devices do |t|
      t.string :name
      t.string :company
    end
  end
end
