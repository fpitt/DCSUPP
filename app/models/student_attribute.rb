=begin

Model: StudentAttribute

The StudentAttribute model stores information about a student.
I.e. their grade in a course.
=end
class StudentAttribute < ActiveRecord::Base

	belongs_to :requirement_subcategory
	belongs_to :user

	attr_accessible :value, :requirement_subcategory_id, :requirement_category_id
end
