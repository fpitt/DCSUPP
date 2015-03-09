class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation

  has_many :projects, :through => :project_applications
  has_many :project_applications
  
  has_one :student_setting
  accepts_nested_attributes_for :student_setting

  has_one :professor_setting
  accepts_nested_attributes_for :professor_setting


end
