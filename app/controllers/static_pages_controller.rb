class StaticPagesController < ApplicationController

  before_action :find_user

  def project
    @projects = Project.order(created_at: :desc).take(10)
  end

  def flip_direction

	respond_to do |format|
		format.html {

			puts params

			@Category_length = Project.all.length
			value = params[:direction].to_i + (params[:pageNumber]).to_i*10 - 10

			puts value

			if value < @Category_length
				@projects = Project.order(created_at: :desc).offset(value).take(10)
				render :partial => "static_pages/partial/projectPosts"
			else 
				render :nothing => true, :status => 200, :content_type => 'text/html'
			end

		}
	end

  end

  private 

	def find_user
	  @current_user = current_user
	end
end
