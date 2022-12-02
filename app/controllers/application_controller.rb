class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:full_name, :username, :email, :password, :password_confirmation) }
  end

    def after_sign_in_path_for(resource)
        user_path(resource)
    end
end
