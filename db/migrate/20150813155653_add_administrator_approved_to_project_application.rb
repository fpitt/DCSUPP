class AddAdministratorApprovedToProjectApplication < ActiveRecord::Migration
  def change
    add_column :project_applications, :administrator_approved, :string
  end
end
