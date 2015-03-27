class CreatePlayerOptions < ActiveRecord::Migration
  def change
    create_table :player_options do |t|
      t.string :value
      t.references :option, index: true
      t.references :player, index: true
      t.timestamps
    end
  end
end
