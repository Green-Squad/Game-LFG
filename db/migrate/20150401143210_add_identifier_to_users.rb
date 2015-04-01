class AddIdentifierToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :identifier, index: true
  end
end
