class Player < ActiveRecord::Base
  belongs_to :group
  belongs_to :player_options
  has_one :region
end
