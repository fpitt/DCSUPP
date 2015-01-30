class StaticPagesController < ApplicationController

	before_action :find_user

	def home
		
	end

	private 

	    def find_user
	      @current_user = current_user
	    end

end
