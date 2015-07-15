class ApplicationController < ActionController::Base

    before_filter :authenticate

    def introduction
        render 'layouts/application'
    end

    protected

        def authenticate
            authenticate_or_request_with_http_basic do |username, password|
                user = User.find_or_create_by(name: username)
                user.name == username && password == "bar"
            end
        end
end