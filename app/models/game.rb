class Game < ActiveRecord::Base
  belongs_to :game_console
  belongs_to :option
  belongs_to :player
  belongs_to :activity
end
