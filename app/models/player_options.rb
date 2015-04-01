class PlayerOptions < ActiveRecord::Base
  has_one :player
  has_one :option
end
