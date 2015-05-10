class RequirementCategory < ActiveRecord::Base

	has_many :requirment_subcategories, dependent: :destroy
  	accepts_nested_attributes_for :requirment_subcategories

	attr_accessible :category_name

	validates :category_name, presence: true, allow_blank: false, uniqueness: true
	
end
