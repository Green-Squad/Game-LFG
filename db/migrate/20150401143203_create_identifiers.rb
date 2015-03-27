class CreateIdentifiers < ActiveRecord::Migration
  def change
    create_table :identifiers do |t|
      t.string :ip_address, null: false
      t.string :fingerprint, null: false
      t.references :user, index: true

      t.timestamps
    end
  end
end
