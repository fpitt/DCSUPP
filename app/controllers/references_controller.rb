class ReferencesController < ApplicationController

    def create
        respond_to do |format|
            format.json {
                param = params[:payload]

                @reference = Reference.new()
                @reference.update_attribute(:student_text, param[:reference][:studentText])
                @reference.update_attribute(:project_application, ProjectApplication.find_by_id(param[:projectApplication]))
                @reference.update_attribute(:user, User.find_by_id(param[:professor][:id]))

                if @reference.save
                    render :json => @reference
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end

    def get_by_project
        respond_to do |format|
            format.json {
                param = params[:payload]

                @reference = Reference.where(project, Project.find_by_id(param[:project]))

                if @reference.save
                    render :json => @reference
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end




end
