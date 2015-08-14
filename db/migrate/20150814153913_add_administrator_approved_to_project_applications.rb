class AddAdministratorApprovedToProjectApplications < ActiveRecord::Migration
  def change
    add_column :project_applications, :administrator_approved, :boolean
  end
end
