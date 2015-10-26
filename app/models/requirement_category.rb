=begin

Model: RequirementCategory

The RequirementCategory model is used to classify RequirementSubcategories
into a type (to add more organization to the database).
For instance, ("CSC148 Grade" and "CSC165 Grade"
subcategories would belong to "Grade" Category).
=end

class RequirementCategory < ActiveRecord::Base

	has_many :requirement_subcategories, dependent: :destroy

	attr_accessible :category_name

	validates :category_name, presence: true, allow_blank: false, uniqueness: true
	
end
