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

		@category = RequirementCategory.order(created_at: :desc).take(10)

	end

	def update_profile

		respond_to do |format|
      		format.js
    	end

	end

	private 

	  def find_user
	    @current_user = current_user
	  end

end
