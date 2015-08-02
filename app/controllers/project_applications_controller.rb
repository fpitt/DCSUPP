class ProjectApplicationsController < ApplicationController

    def create
        respond_to do |format|
            format.json {
                param = params[:payload]

                @project_application = ProjectApplication.new(param[:application])
                @project_application.update_attribute(:project, Project.find_by_id(param[:project]))
                @project_application.user = @current_user

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
