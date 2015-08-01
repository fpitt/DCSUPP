class ProjectApplicationsController < ApplicationController
    def create
        respond_to do |format|
            format.json {
                param = params[:payload]

                @project_application = ProjectApplication.new(param[:application])
                @project_application.update_attribute(:user, @current_user)
                @project_application.update_attribute(:project, Project.find_by_id(param[:project]));

                if @project_application.save
                    render :json => @project_application
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end
end
