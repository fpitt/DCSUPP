class ApplicationController < ActionController::Base

    before_filter :authenticate

    #   render views/layouts/application when application launches
    def introduction
        render 'layouts/application'
    end

    protected

        #   authenticate user
        def authenticate

            authenticate_or_request_with_http_basic do |username|
                user = User.find_or_create_by(name: username)
                #NOTE:
                #The site was first deployed with name column storing the UTOR_ID, however
                #future versions required the name of the individual and the column utor_id
                #is assigned as the "name" of the user.
                user.save
                @current_user = user
            end
        end
end