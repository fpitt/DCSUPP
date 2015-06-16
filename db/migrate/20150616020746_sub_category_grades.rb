class SubCategoryGrades < ActiveRecord::Migration
  def change

  	add_column :requirement_subcategories, :grades, :boolean
  end
end
