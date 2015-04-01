class Activity < ActiveRecord::Base
  belongs_to :activity
  belongs_to :group
  has_one :game
end
