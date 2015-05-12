class UsersController < ApplicationController

	before_action :authenticate_user!, :find_user

	def home
		@student_attributes = RequirementCategory.find_by_sql(
			"SELECT DISTINCT requirement_categories.category_name FROM requirement_categories
			INNER JOIN requirement_subcategories on
			requirement_categories.id = requirement_subcategories.requirement_category_id AND
			requirement_subcategories.student_attribute = '1'
			ORDER BY requirement_categories.created_at desc")

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
