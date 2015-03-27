class Console < ActiveRecord::Base
  has_many :players
  has_many :game_consoles
  has_many :games, through: :game_consoles
end
