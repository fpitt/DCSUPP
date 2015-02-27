class StaticPagesController < ApplicationController

  before_action :find_user

  def project
    @projects = Project.all
  end


  private 

	def find_user
	  @current_user = current_user
	end
end
