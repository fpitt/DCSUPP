class CreateStudentCourses < ActiveRecord::Migration
  def change
    create_table :student_courses do |t|

      t.timestamps null: false
      t.belongs_to :user, index: true
      t.boolean :courseA, :default => false
      t.boolean :courseB, :default => false
      t.boolean :courseC, :default => false
      t.boolean :courseD, :default => false
      t.boolean :courseE, :default => false
      t.text :student_message
    end
  end
end
