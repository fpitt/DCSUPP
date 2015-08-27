class StudentAttribute < ActiveRecord::Base

	belongs_to :requirement_subcategory
	belongs_to :user

	attr_accessible :value
end
