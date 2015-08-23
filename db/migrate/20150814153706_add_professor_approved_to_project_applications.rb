class AddProfessorApprovedToProjectApplications < ActiveRecord::Migration
  def change
    add_column :project_applications, :professor_approved, :boolean
  end
end
