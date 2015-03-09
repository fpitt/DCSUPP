class StudentRequirements < ActiveRecord::Migration
  def change
  	create_table :project_requirements, id: false do |t|

      t.timestamps null: false
      t.belongs_to :requirement_subcategory, index: true
      t.belongs_to :user, index: true

      t.string :attribute_array, array: true
      t.string :value

    end

  end
end
