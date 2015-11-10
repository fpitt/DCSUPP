class ProjectRequirementsController < ApplicationController
    #   get this project's project requirement
    def get_requirements_of_project
        respond_to do |format|
            format.json {

                @requirements = ProjectRequirement.where(:project_id => params[:payload][:id])
                if @requirements
                    render :json => @requirements
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end
end
