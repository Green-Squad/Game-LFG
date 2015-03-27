class GameConsole < ActiveRecord::Base
  belongs_to :game
  belongs_to :console
end
