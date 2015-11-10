=begin

Model: Project

Project model stores information about a research position (i.e. project title, project description,
the project's supervisor)

It also has ProjectRequirements that the professor can add.
ProjectRequirements are either student attributes (i.e. a student's course
grade) that a professor can add as a form field in the position's
application, or it can be a detail of the project that the professor would
like to add about the project (i.e. compensation type).
If the project requirement is a student attribute, the ProjectRequirement model's
value field will be left blank.
If not, value will be set by professor who created the Project (for instance, Compensation
ProjectRequirement's value can be set as "Paid").
=end

class Project < ActiveRecord::Base
	
	belongs_to :user

	has_many :project_application
	has_many :project_requirement

	attr_accessible :title, :text

	attr_protected :user

  	validates :title, presence: true, allow_blank: false
  	validates :text, presence: true, allow_blank: false


end
