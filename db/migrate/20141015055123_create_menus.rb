class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.integer :restaurant_id
      t.string :food_name
      t.integer :price

      t.timestamps
    end
  end
end
