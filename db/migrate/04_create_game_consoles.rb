class CreateGameConsoles < ActiveRecord::Migration[5.1]

  def change
    create_table :game_consoles do |t|
      t.integer :console_id
      t.integer :game_id
    end
  end
end
