class CreateConsoles < ActiveRecord::Migration
  def change
    create_table :consoles do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
