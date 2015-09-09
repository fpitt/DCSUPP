=begin

Model: User

A User is a user of DCSUPP,
may be an admin, professor, or student.

=end
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  attr_accessible :name

  has_many :project_applications

  has_many :ratings
  
  has_one :student_setting

  has_one :professor_setting

end
