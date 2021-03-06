class ApplicationController < ActionController::Base

    before_filter :authenticate

    #   render views/layouts/application when application launches
    def introduction
        #DEFAULT ROUTE DO NOT DELETE
        render 'layouts/application'
    end

    protected

        #   authenticate user
        def authenticate

            authenticate_or_request_with_http_basic do |username|
                user = User.find_or_create_by(name: username)
                user.save
                @current_user = user
            end
        end
end