class ProjectRequirement < ActiveRecord::Base

	belongs_to :project
	belongs_to :requirement_subcategory
end
