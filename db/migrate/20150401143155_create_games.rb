class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :slug
      t.references :game_console, index: true
      t.references :option, index: true
      t.references :player, index: true
      t.references :activity, index: true

      t.timestamps
    end
  end
end
