class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :category
      t.float :rate
      t.string :address
      t.string :image_path
      t.string :business_hours
      t.string :phone_number
      t.string :regular_holiday
      t.string :link

      t.timestamps
    end
  end
end
