class RequirementSubcategory < ActiveRecord::Base

	belongs_to :requirement_category

	has_many :project_requirements
	has_many :student_attributes

	has_many :users, :through => :student_attributes
	has_many :projects, :through => :project_requirements

	validates :sub_category_name, presence: true, allow_blank: false, uniqueness: true
	
	
end
