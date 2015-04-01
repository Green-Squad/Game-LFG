class Group < ActiveRecord::Base
  has_one :player
  has_one :activity
end
