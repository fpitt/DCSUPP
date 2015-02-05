class UsersController < ApplicationController

	before_action :authenticate_user!, :find_user

	def home
		
	end

	private 

	  def find_user
	    @current_user = current_user
	  end

end
