class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  has_many :events, :through => :favorites
  has_many :favorites, :order => 'created_at desc'
  has_many :restaurants, :through => :reviews
  has_many :reviews, :order => 'created_at desc'
end
