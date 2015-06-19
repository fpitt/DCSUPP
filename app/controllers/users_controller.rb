class UsersController < ApplicationController

	before_action :authenticate_user!, :find_user

	def home

	end

	def create_project

	end

	def manage_category
		
	end

	def students

	end

	private 

	  def find_user
	    @current_user = current_user
	  end

end
