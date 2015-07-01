class UsersController < ApplicationController

	before_action :find_user

	def student_page

	end

	def create_project

	end

	def manage_category
		
	end

	def students

	end

	#Private Methods ----------->
	private 
		
		def find_user
	    	@current_user = current_user
	  	end

end
