class CreateStudentSettings < ActiveRecord::Migration
  def change
    create_table :student_settings do |t|

      t.timestamps null: false
      t.belongs_to :user, index: true
      t.boolean :apply_project, :default => true
      t.boolean :allow_viewing, :default => false
    end
  end
end
