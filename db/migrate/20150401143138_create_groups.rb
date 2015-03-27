class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :looking_for, null: false
      t.text :notes, null: false, default: ''
      t.timestamp :expires_at, null: false
      t.references :player, index: true
      t.references :activity, index: true

      t.timestamps
    end
  end
end
