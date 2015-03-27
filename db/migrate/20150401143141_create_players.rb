class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :gamertag, null: false
      t.boolean :mic, null: false, default: false

      t.references :region, index: true
      t.references :console, index: true
      t.references :game, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
