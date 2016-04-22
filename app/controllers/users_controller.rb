class UsersController < ApplicationController

    def information
        respond_to do |format|
            format.json{
                param = params[:payload]
                @current_user.contact_email = param[:contact_email]
                @current_user.introduction = param[:introduction]
                @current_user.fullname = param[:fullname]

                if @current_user.save
                    render :json => @current_user
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
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

                if @current_user                    
                    render :json => @current_user
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

    #   get filtered list of projects by subcategories
    def filter_students
        respond_to do |format|
            format.json {
                @students = User.where(:professor => false, :administrator => false)
                param = params[:payload]

                #   go through each filter and get students matching all filters
                if param[:filter]
                    for filter in param[:filter]

                        #   get student matching current filter
                        @student_attributes = StudentAttribute.where(:requirement_subcategory_id => filter[:id])
                        @filter_student = Array.new
                        for attr in @student_attributes
                            @filter_student.push(User.find_by_id(attr.user_id))
                        end

                        #   exclude students
                        #   that don't have current filter from list
                        @new_student_list = Array.new
                        for item in @filter_student
                            if @students.include?(item)
                                @new_student_list.push(item)
                            end
                        end
                        @students = @new_student_list
                    end
                end

                #   grab a page of students (10)
                direction = param[:direction]
                current_offset = (params[:payload][:pagenumber] - 1)*10

                if @students and current_offset + direction < @students.length && current_offset + direction >= 0
                    offset = current_offset + direction
                    initial = offset
                    terminate = offset + 9
                    render :json => @students[initial..terminate]
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end

end
