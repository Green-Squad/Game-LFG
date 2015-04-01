class Console < ActiveRecord::Base
  belongs_to :game_console
  belongs_to :player
end
