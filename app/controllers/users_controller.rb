class UsersController < ApplicationController

	before_action :find_user

	def student_page

	end

	def create_project

	end

	def manage_category
		
	end

	def students
		takes = rand(1..9)
        respond_to do |format|
            format.json {
                @students = User.all.offset(take).take(10)

                render :json => @students
            }
        end
	end

    def show
        respond_to do |format|
            format.json {

                @student = User.find_by_id(params[:id])

                if @student
                    render :json => @student
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end


	#Private Methods ----------->
	private 
		
		def find_user
	    	@current_user = current_user
	  	end

end
