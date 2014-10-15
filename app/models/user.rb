class User < ActiveRecord::Base
  has_many :events, :through => :favorites
  has_many :favorites, :order => 'created_at desc'
  has_many :restaurants, :through => :reviews
  has_many :reviews, :order => 'created_at desc'
end
