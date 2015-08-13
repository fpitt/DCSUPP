class ProjectApplicationsController < ApplicationController

    def create
        respond_to do |format|
            format.json {
                param = params[:payload]
                @project_application = ProjectApplication.new()
                @project_application.update_attribute(:title, param[:application][:title])
                @project_application.update_attribute(:message, param[:application][:message])
                @project_application.update_attribute(:project, Project.find_by_id(param[:project]))
                @project_application.update_attribute(:user, @current_user)
                @project_application.update_attribute(:professor_approved, 'pending')
                @project_application.update_attribute(:student_approved, 'pending')
                @project_application.update_attribute(:administrator_approved, 'pending')

                if param[:requirements]
                    for requirement in param[:requirements]
                        if StudentAttribute.find_by_requirement_subcategory_id_and_user_id(requirement[:id], @current_user.id)
                        else
                            @student_attribute = StudentAttribute.new()
                            @student_attribute.update_attribute(:requirement_subcategory, RequirementSubcategory.find_by_id(requirement[:id]))
                            @student_attribute.update_attribute(:user, @current_user)
                            @student_attribute.update_attribute(:value, requirement[:value])
                            @student_attribute.save
                        end
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
end
