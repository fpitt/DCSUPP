class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects
  has_one :student_setting
  accepts_nested_attributes_for :student_setting
  has_and_belongs_to_many :project_applications
  has_one :professor_setting
  accepts_nested_attributes_for :professor_setting
  has_one :student_course
  accepts_nested_attributes_for :student_course

end
