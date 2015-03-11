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

	def manage_category

		@category = RequirementCategory.order(created_at: :desc)

	end

	def update_profile

		puts params

		param = params[:user][:student_settings]

		puts param

		if !current_user.student_setting
			current_user.student_setting = StudentSetting.new

      		current_user.student_setting.save
		end 

		respond_to do |format|
      		format.js
    	end

	end

	private 

	  def find_user
	    @current_user = current_user
	  end

end
