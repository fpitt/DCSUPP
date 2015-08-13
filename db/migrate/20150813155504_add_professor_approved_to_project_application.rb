class AddProfessorApprovedToProjectApplication < ActiveRecord::Migration
  def change
    add_column :project_applications, :professor_approved, :string
  end
end
