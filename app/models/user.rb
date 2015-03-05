class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation

  has_many :projects
  
  has_one :student_setting
  accepts_nested_attributes_for :student_setting

  has_one :professor_setting
  accepts_nested_attributes_for :professor_setting

  has_one :student_course
  accepts_nested_attributes_for :student_course

  after_commit :setup_dependencies, on: :create

  private

    def setup_dependencies

      #Create the Dependencies
      self.student_setting = StudentSetting.new
      self.student_setting.save

    end


end
