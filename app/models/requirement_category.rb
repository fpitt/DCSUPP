class RequirementCategory < ActiveRecord::Base

	has_many :requirment_subcategories

	attr_accessible :category_name

	validates :category_name, presence: true, allow_blank: false
	
end
