class UsersController < ApplicationController

	def student_page

	end

	def create_project

	end

	def manage_category
		
	end

	#   get a page of 10 students (used in List Student page)
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

    #   get student by id
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

    #   return the current user
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

    #   return a page of 10 professors (used in List Professor page)
    def grab_professors
        professor_size = User.where(:professor => true).length
        current_offset = (params[:payload][:pagenumber] - 1)*10
        direction = params[:payload][:direction]

        respond_to do |format|
            format.json {

                if current_offset + direction < professor_size && current_offset + direction >= 0
                    offset = current_offset + direction
                    @professors = User.where(:professor => true).offset(offset).take(10)
                    render :json => @professors
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end

            }
        end
    end

    #   return all processors with name containing keyword
    def get_professor_containing_keyword
        respond_to do |format|
            format.json {
                param = params[:payload]
                    @professor = User.where('name LIKE ?', '%' + param[:professor] + '%').where(:professor => true)
                    if @professor
                        render :json => @professor
                    else
                        render :nothing => true, :status => 200, :content_type => 'text/html'
                    end
            }
        end

    end

end
