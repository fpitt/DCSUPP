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
                user = User.find_or_create_by(utor_id: username)
                user.name = username
                #Initially set the User name to the UTOR ID, but change after
                user.save
                @current_user = user
            end
        end
end