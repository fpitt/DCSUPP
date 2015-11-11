class CreateProjectRequirements < ActiveRecord::Migration
  def change
    create_table :project_requirements do |t|

      t.timestamps null: false
      t.belongs_to :requirement_subcategory, index: true
      t.belongs_to :project, index: true

      t.string :value, :null => true
      t.string :subcategory_name
      t.string :comparison

    end
  end
end
