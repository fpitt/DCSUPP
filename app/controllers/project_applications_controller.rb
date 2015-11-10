class ProjectApplicationsController < ApplicationController

    #   create a new project application
    def create
        respond_to do |format|
            format.json {
                param = params[:payload]
                @project_application = ProjectApplication.new()
                @project_application.assign_attributes({:title => param[:title],
                    :message => param[:message], :project => Project.find_by_id(param[:project]),
                    :user => @current_user}, :without_protection => true)

                #   add student attributes to project application
                if param[:requirements]
                    for requirement in param[:requirements]
                        @student_attribute = StudentAttribute.where(:requirement_subcategory_id => requirement[:id], :user_id => @current_user.id).first_or_create
                        @student_attribute.value = requirement[:value]
                        @student_attribute.save
                    end
                end

                if @project_application.save
                    render :json => @project_application
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end

    #   attach resume to this application
    def upload_resume
        respond_to do |format|
            param = params
            format.json {
                @project_application = ProjectApplication.find_by_id(param[:application])
                if @project_application
                    @project_application.resume = param[:file] 
                    @project_application.resume_url = @project_application.resume.url
                    if @project_application.save
                        render :json => @project_application
                    else
                        render :nothing => true, :status => 200, :content_type => 'text/html'
                    end
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end

    #   get all student-professor project assignments (i.e project application objects that
    #   have both been accepted by student and professor) that still require admin's approval
    def get_require_administrator_approval_applications
        respond_to do |format|
            param = params[:payload]
            format.json {
                @project_applications = ProjectApplication.where(:student_approved => true, :professor_approved => true, :administrator_approved => nil)
                if @project_applications
                    render :json => @project_applications
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end

    #   get all student-professor project assignments   (i.e project application objects that
    #   have both been accepted by student and professor)
    def get_project_assignments
        respond_to do |format|
            param = params[:payload]
            format.json {
                @project_applications = ProjectApplication.where(:student_approved => true, :professor_approved => true)
                if @project_applications
                    render :json => @project_applications
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end

    #   get all applications belonging to current user
    def get_applications_of_user
        respond_to do |format|
            format.json {
                @project_applications = ProjectApplication.where(:user_id => @current_user.id)
                if @project_applications
                    render :json => @project_applications
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end

    #   get all applications for a project
    def get_applications_of_project
        respond_to do |format|
            param = params[:payload]
            format.json {
                @project_applications = ProjectApplication.where(:project_id => Project.find_by_id(param[:id]))
                if @project_applications
                    render :json => @project_applications
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end

    #   saved user's decision to accept/reject application
    #   if user is student: update student_approved
    #   if user is professor: update professor_approved
    #   if user is admin: update administrator_approved
    def process_offer
        respond_to do |format|
            format.json {
                param = params[:payload]
                @project_application = ProjectApplication.find_by_id(param[:application])

                if @project_application
                    if @current_user.administrator
                        @project_application.administrator_approved = param[:approved]
                    elsif @current_user.professor
                        @project_application.professor_approved = param[:approved]
                    else
                         @project_application.student_approved = param[:approved]
                    end

                    if @project_application.save
                        render :json => @project_application
                    else
                        render :nothing => true, :status => 200, :content_type => 'text/html'
                    end
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end

    #   get a project application by its id
    def show
        respond_to do |format|
            format.json {

                @project_application = ProjectApplication.find_by_id(params[:id])

                if @project_application
                    render :json => @project_application
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end

    #   return a page of project applications belonging to user
    def flip_applications_of_user
        application_size = ProjectApplication.where(:user_id => @current_user.id).length
        current_offset = (params[:payload][:pagenumber] - 1)*10
        direction = params[:payload][:direction]
        respond_to do |format|
            format.json {
                if current_offset + direction < application_size && current_offset + direction >= 0
                    offset = current_offset + direction
                    @project_applications = ProjectApplication.where(:user_id => @current_user.id).offset(offset).take(10)
                    render :json => @project_applications
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end

end
