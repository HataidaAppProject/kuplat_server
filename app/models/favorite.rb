class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :events

  validates_uniqueness_of :event_id, :scope => :user_id
end
