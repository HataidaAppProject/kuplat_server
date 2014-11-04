class AddParamsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :sex, :integer
    add_column :users, :student_id, :integer
    add_column :users, :faculty, :string
    add_column :users, :entrance_year, :string
    add_column :users, :circle, :string
    add_column :users, :info_source, :integer
  end
end
