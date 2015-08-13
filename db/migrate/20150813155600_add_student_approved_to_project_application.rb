class AddStudentApprovedToProjectApplication < ActiveRecord::Migration
  def change
    add_column :project_applications, :student_approved, :string
  end
end
