class ChangeRateToRestaurant < ActiveRecord::Migration
  def change
  	change_column_default(:restaurants,:rate,0)
  end
end
