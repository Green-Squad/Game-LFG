class CreateIdentifiers < ActiveRecord::Migration
  def change
    create_table :identifiers do |t|
      t.string :ip_address
      t.string :fingerprint

      t.timestamps
    end
  end
end
