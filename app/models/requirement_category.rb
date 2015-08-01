class RequirementCategory < ActiveRecord::Base

	has_many :requirement_subcategories, dependent: :destroy

	attr_accessible :category_name

	validates :category_name, presence: true, allow_blank: false, uniqueness: true
	
end
