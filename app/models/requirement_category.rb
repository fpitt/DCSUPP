class RequirementCategory < ActiveRecord::Base

	has_many :requirement_subcategories, dependent: :destroy
  	accepts_nested_attributes_for :requirement_subcategories

	attr_accessible :category_name

	validates :category_name, presence: true, allow_blank: false, uniqueness: true
	
end
