class GameConsole < ActiveRecord::Base
  has_one :game
  has_one :console
end
