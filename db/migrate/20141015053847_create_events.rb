class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.integer :fav
      t.datetime :date
      t.string :place
      t.integer :price
      t.integer :type
      t.text :description
      t.string :image_path
      t.string :host
      t.string :contact
      t.string :link

      t.timestamps
    end
  end
end
