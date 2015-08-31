class AddAttachmentResumeToProjectApplications < ActiveRecord::Migration
  def self.up
    change_table :project_applications do |t|
      t.attachment :resume
    end
  end

  def self.down
    remove_attachment :project_applications, :resume
  end
end
