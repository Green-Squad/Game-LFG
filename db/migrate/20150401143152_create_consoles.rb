class CreateConsoles < ActiveRecord::Migration
  def change
    create_table :consoles do |t|
      t.references :game_console, index: true
      t.references :player, index: true

      t.timestamps
    end
  end
end
