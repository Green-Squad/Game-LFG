class PlayerOption < ActiveRecord::Base
  belongs_to :option
  belongs_to :player
end
