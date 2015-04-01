class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :looking_for
      t.text :notes
      t.timestamp :expires_at

      t.timestamps
    end
  end
end
