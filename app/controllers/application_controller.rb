class ApplicationController < ActionController::Base

    before_filter :authenticate

    def introduction
        render 'layouts/application'
    end

    protected

        def authenticate
            authenticate_or_request_with_http_basic do |username|
                user = User.find_or_create_by(name: username)
                user.name == username
                user.save
            end
        end
end