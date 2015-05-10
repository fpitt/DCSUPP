class AddRequirementSubcategories < ActiveRecord::Migration
  def change

  	add_column :requirement_subcategories, :placeholder, :string
  	add_column :requirement_subcategories, :student_attribute, :boolean
  end
end
