class UsersController < ApplicationController

	before_action :authenticate_user!, :find_user

	def home
		
	end

	def create_project

	end

	def change

		respond_to do |format|
      		format.js
    	end

	end

	def update_profile

		puts params

		param = params[:user][:student_settings]

		puts param

		if !current_user.student_setting
			current_user.student_setting = StudentSetting.new

      		current_user.student_setting.save
		end 

	    #Update User Settings [No Mass- Assignment]
	   current_user.student_setting.update_attribute(:settings_initalized, true)

	    current_user.student_setting.update_attribute(:student_info_A, 
	      param[:student_info_A])
	    current_user.student_setting.update_attribute(:student_info_B, 
	      param[:student_info_B])
	    current_user.student_setting.update_attribute(:student_info_C, 
	      param[:student_info_C])
	    current_user.student_setting.update_attribute(:student_info_D, 
	      param[:student_info_D])
	    current_user.student_setting.update_attribute(:student_info_F, 
	      param[:student_info_F])

		respond_to do |format|
      		format.js
    	end

	end

	private 

	  def find_user
	    @current_user = current_user
	  end

end
