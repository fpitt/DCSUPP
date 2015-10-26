class StudentAttributeAdd < ActiveRecord::Migration
  def change
  	add_column :student_attributes, :requirement_category_id, :integer
  end
end
