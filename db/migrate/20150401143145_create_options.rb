class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :name
      t.string :input_type
      t.string :placeholder
      t.integer :min_value
      t.integer :max_value
      t.boolean :required
      t.references :player_options, index: true

      t.timestamps
    end
  end
end
