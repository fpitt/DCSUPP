class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :student_text
      t.string :professor_text
      t.boolean :professor_approved
      t.boolean :student_approved
      t.integer :references
      t.integer :project_application_id

      t.timestamps null: false
    end
  end
end
