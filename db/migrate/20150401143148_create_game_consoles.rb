class CreateGameConsoles < ActiveRecord::Migration
  def change
    create_table :game_consoles do |t|
      t.references :game, index: true
      t.references :console, index: true
      t.timestamps
    end
  end
end
