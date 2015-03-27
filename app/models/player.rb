class Player < ActiveRecord::Base
  belongs_to :console
  belongs_to :game
  belongs_to :region
  belongs_to :user
  has_many :groups
  has_many :player_options
end
