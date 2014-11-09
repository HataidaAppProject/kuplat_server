class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.integer :fav, :default => 0
      t.datetime :date
      t.string :place
      t.integer :price
      t.integer :category
      t.text :description
      t.string :image_path
      t.string :host
      t.string :contact
      t.string :link

      t.timestamps
    end
  end
end
