class Activity < ActiveRecord::Base
  belongs_to :activity
  belongs_to :group
end
