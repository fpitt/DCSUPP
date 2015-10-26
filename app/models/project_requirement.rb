=begin

Model: ProjectRequirement

ProjectRequirements define a Project's requirements.
ProjectRequirements are either student attributes (i.e. a student's course
grade) that a professor can add as a form field in the position's
application, or it can be a detail of the project that the professor would
like to add about the project (i.e. compensation type).
If the project requirement is a student attribute, the ProjectRequirement model's
value field will be left blank.
If not, value will be set by professor who created the Project (for instance, Compensation
ProjectRequirement's value can be set as "Paid").

=end
class ProjectRequirement < ActiveRecord::Base

	belongs_to :project
	belongs_to :requirement_subcategory
end
