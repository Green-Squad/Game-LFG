class CreateGameConsoles < ActiveRecord::Migration
  def change
    create_table :game_consoles do |t|

      t.timestamps
    end
  end
end
