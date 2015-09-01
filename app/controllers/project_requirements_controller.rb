class ProjectRequirementsController < ApplicationController

    def get_requirements_of_project
        respond_to do |format|
            format.json {
                param = params[:payload]

                @requirements = ProjectRequirement.where(:project_id => param[:project])
                if @requirements
                    render :json => @requirements
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end




end
