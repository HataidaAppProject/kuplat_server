class ChangeFavtoEvent < ActiveRecord::Migration
  def change
  	change_column_default(:events,:fav,0)
  end
end
