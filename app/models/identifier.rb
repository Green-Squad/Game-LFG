class Identifier < ActiveRecord::Base
  belongs_to :user
  validates :fingerprint, uniqueness: {scope: :ip_address}
end
