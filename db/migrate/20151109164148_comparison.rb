class Comparison < ActiveRecord::Migration
  def change
  	add_column :project_requirements, :comparison, :string
  	remove_column :project_requirements, :value_array, :string
  end
end
