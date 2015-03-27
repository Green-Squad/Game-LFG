class Group < ActiveRecord::Base
  belongs_to :activity
  belongs_to :player
end
