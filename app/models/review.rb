class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurants

  # 1$B%f!<%6(B1$B%3%a%s%H$K$9$kI,MW$,$J$$$+$b$7$l$J$$$N$GJ]N1(B
  validates_uniqueness_of :restaurant_id, :scope => :user_id
end
