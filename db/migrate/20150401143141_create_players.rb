class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :gamertag
      t.boolean :mic
      t.references :group, index: true
      t.references :player_options, index: true

      t.timestamps
    end
  end
end
