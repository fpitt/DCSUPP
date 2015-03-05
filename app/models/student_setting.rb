class StudentSetting < ActiveRecord::Base

	belongs_to :user

	attr_accessible :student_info_A, :student_info_B, :student_info_C, :student_info_D, :student_info_F, :settings_initalized

	validates :student_info_A, presence: true, allow_blank: false
  	validates :student_info_B, presence: true, allow_blank: false
  	validates :student_info_C, presence: true, allow_blank: false
  	validates :student_info_D, presence: true, allow_blank: false
  	validates :student_info_E, presence: true, allow_blank: false
end
