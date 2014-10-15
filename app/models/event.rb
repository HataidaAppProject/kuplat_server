class Event < ActiveRecord::Base
  has_many :users, :through => :favorites
  has_many :favorites, :order => 'created_at desc'
end
