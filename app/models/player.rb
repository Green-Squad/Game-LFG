class Player < ActiveRecord::Base
  belongs_to :group
  belongs_to :player_options
  has_one :region
  has_one :console
  has_one :game
end
