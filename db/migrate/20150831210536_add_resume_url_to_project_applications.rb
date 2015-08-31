class AddResumeUrlToProjectApplications < ActiveRecord::Migration
  def change
    add_column :project_applications, :resume_url, :string
  end
end
