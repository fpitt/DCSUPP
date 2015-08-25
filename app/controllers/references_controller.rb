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

    def get_by_project_application
        respond_to do |format|
            format.json {
                param = params[:payload]

                @reference = Reference.where(:project_application_id, param[:projectApplication])

                if @reference
                    render :json => @reference
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end

    def get_student_approved_by_project_application
        respond_to do |format|
            format.json {
                param = params[:payload]

                @reference = Reference.where(:project_application_id, param[:projectApplication])

                if @reference
                    render :json => @reference
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end

    def get_reference_requests_of_professor
        respond_to do |format|
            format.json {
                @reference = Reference.where(:user_id => @current_user.id, :professor_approved => nil)
                if @reference
                    render :json => @reference
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end

    def process_reference_approval
        respond_to do |format|
            format.json {
                param = params[:payload]
                @reference = Reference.find_by_id(param[:id])

                if @reference
                    if @current_user.professor
                        @reference.update_attribute(:professor_approved, param[:approved])
                    else
                         @reference.update_attribute(:student_approved, param[:approved])
                    end

                    @reference.save

                    render :json => @reference
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end

    def add_professor_reference_text
        respond_to do |format|
            format.json {
                param = params[:payload]
                @reference = Reference.find_by_id(param[:id])

                if @reference
                    @reference.update_attribute(:professor_text, param[:professorText])
                    @reference.save

                    render :json => @reference
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end


end
