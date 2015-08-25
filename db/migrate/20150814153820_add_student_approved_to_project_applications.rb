class AddStudentApprovedToProjectApplications < ActiveRecord::Migration
  def change
    add_column :project_applications, :student_approved, :boolean
  end
end
