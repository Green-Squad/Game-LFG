class Game < ActiveRecord::Base
  has_many :players
  has_many :game_consoles
  has_many :consoles, through: :game_consoles
  has_many :options
  has_many :activities
end
