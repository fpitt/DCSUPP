class ProjectApplication < ActiveRecord::Base

	belongs_to :user
	belongs_to :project

	has_attached_file :resume
	validates_attachment_content_type :resume, :content_type => ["application/pdf"]
	
end
