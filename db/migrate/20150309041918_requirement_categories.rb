class RequirementCategories < ActiveRecord::Migration
  def change
  	create_table :requirement_categories do |t|

      t.timestamps null: false
      t.string :category_name
    end
  end
end
