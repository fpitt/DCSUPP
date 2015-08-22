class AddStudentApprovatedToReferences < ActiveRecord::Migration
  def change
    add_column :references, :student_approved, :boolean
  end
end
