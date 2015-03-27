class Activity < ActiveRecord::Base
  belongs_to :game
  has_many :groups
  belongs_to :activity
  has_one :activity
end
