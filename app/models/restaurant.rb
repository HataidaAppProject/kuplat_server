class Restaurant < ActiveRecord::Base
  has_many :users, :through => :reviews
  has_many :reviews, -> { order 'created_at desc'}
  has_many :menus
end
