class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :name, null: false
      t.string :input_type, null: false, default: 'text'
      t.string :placeholder, null: false
      t.integer :min_value
      t.integer :max_value
      t.boolean :required, null: false, default: false
      t.references :game, index: true

      t.timestamps
    end
  end
end
