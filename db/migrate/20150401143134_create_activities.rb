class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.references :game, index: true
      t.references :activity, index: true

      t.timestamps
    end
  end
end
