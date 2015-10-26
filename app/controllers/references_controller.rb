class ReferencesController < ApplicationController

    #   create a reference request
    def create
        respond_to do |format|
            format.json {
                param = params[:payload]

                @reference = Reference.new()
                @reference.update_attribute(:student_text, param[:student_text])
                @reference.update_attribute(:project_application_id, param[:application])
                @reference.update_attribute(:user_id, param[:professor])

                if @reference.save
                    render :json => @reference
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end

    #   get all reference requests for a particular project application
    def get_by_project_application
        respond_to do |format|
            format.json {
                param = params[:payload]

                @reference = Reference.where(:project_application_id => param[:application])

                if @reference
                    render :json => @reference
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end

    #   get all reference requests that the student has decided to use
    #   for a particular project application
    def get_student_approved_by_project_application
        respond_to do |format|
            format.json {
                param = params[:payload]

                @reference = Reference.where(:project_application_id => param[:application], :student_approved => true)

                if @reference
                    render :json => @reference
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end

    #   get the current user's pending reference requests
    #   only professors (and admins, for testing purposes) have access to this endpoint
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

    #   save user's decision to accept reference request (if professor)
    #   or user reference in project application (if student)
    def process_reference_approval
        respond_to do |format|
            format.json {
                param = params[:payload]
                @reference = Reference.find_by_id(param[:reference])

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

    #   attach professor's message to reference
    def add_professor_reference_text
        respond_to do |format|
            format.json {
                param = params[:payload]
                @reference = Reference.find_by_id(param[:reference])

                if @reference
                    @reference.update_attribute(:professor_text, param[:professor_text])
                    @reference.save


                    render :json => @reference
                else
                    render :nothing => true, :status => 200, :content_type => 'text/html'
                end
            }
        end
    end


end
