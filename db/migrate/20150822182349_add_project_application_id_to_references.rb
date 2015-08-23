class AddProjectApplicationIdToReferences < ActiveRecord::Migration
  def change
    add_column :references, :project_application_id, :integer
  end
end
