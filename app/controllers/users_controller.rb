class UsersController < ApplicationController

	def student_page

	end

	def create_project

	end

	def manage_category
		
	end

	def students
        student_size = User.all.length
        current_offset = (params[:payload][:pagenumber] - 1)*10
        direction = params[:payload][:direction]

        respond_to do |format|
            format.json {
                if current_offset + direction < student_size && current_offset + direction >= 0
                    offset = current_offset + direction
                    @students = User.all.offset(offset).take(10)   
                    render :json => @students
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
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
        respond_to do |format|
            format.json {
                param = params[:payload]
                @user = User.find_by_id(param[:id])
                @user.update_attribute(:name, param[:name])
                @user.update_attribute(:email, param[:email])
                if @user.save
                    render :json => @user
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end

end
