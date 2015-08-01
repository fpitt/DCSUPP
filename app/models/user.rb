class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  attr_accessible :name

  has_many :project_applications
  
  has_one :student_setting

  has_one :professor_setting

end
