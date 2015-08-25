class AddLookingForStudentsdToProject < ActiveRecord::Migration
  def change
    add_column :projects, :looking_for_students, :boolean
  end
end
