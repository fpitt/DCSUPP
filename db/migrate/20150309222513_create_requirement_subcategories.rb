class CreateRequirementSubcategories < ActiveRecord::Migration
  def change
    create_table :requirement_subcategories do |t|

      t.timestamps null: false
      t.string :sub_category_name
      t.belongs_to :requirement_category, index: true
      t.string :attribute_type
      t.string :upper_limit, :null => true
      t.string :lower_limit, :null => true
      t.string :regex, :null => true
      t.string :placeholder
      t.boolean :student_attribute

    end
  end
end
