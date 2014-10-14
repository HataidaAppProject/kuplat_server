class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :sex
      t.integer :student_id
      t.string :faculty
      t.string :entrance_year
      t.string :circle
      t.integer :info_source

      t.timestamps
    end
  end
end
