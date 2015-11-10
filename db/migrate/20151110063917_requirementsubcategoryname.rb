class Requirementsubcategoryname < ActiveRecord::Migration
  def change
  	add_column :project_requirements, :subcategory_name, :string
  end
end
