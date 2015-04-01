class CreatePlayerOptions < ActiveRecord::Migration
  def change
    create_table :player_options do |t|
      t.string :value

      t.timestamps
    end
  end
end
