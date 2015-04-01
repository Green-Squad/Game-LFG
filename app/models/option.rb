class Option < ActiveRecord::Base
  belongs_to :player_options
  has_one :game
end
