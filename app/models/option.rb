class Option < ActiveRecord::Base
  belongs_to :game
  has_many :player_options
end
