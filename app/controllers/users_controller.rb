class UsersController < ApplicationController

	def student_page

	end

	def create_project

	end

	def manage_category
		
	end

	def students
        respond_to do |format|
            format.json {
                @students = User.all

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

    def get_current_user
        respond_to do |format|
            format.json {

                puts @current_user.name

                if @current_user                    
                    render :json => @current_user
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end

    def update
        logger.debug 'here'
        respond_to do |format|
            format.json {
                param = params[:payload]
                @user = User.find_by_id(param[:id])
                @user.name = param[:name]
                @user.email = param[:email]
                if @user.save
                    render :json => @user
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end

end
