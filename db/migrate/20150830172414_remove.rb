class Remove < ActiveRecord::Migration
  def change
  	remove_column :student_attributes, :value_array
  end
end
