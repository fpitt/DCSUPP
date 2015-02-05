class ApplicationController < ActionController::Base

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit :username, :email, :password, :password_confirmation
      end
    end
end