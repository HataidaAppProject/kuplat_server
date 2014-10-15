class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurants

  # 1ユーザ1コメントにする必要がないかもしれないので保留
  validates_uniqueness_of :restaurant_id, :scope => :user_id
end
