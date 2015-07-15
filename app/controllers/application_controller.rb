class ApplicationController < ActionController::Base

    before_filter :authenticate

    def introduction
        render 'layouts/application'
    end

    protected

        def authenticate
            authenticate_or_request_with_http_basic do |username, password|
                username == "foo" && password == "bar"
            end
        end
end