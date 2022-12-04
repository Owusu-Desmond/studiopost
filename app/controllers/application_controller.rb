class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:full_name, :username, :email, :password, :password_confirmation)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:full_name, :username, :email, :image, :bio, :password, :password_confirmation, :current_password)
    end
  end

  # pass username as a parameter to the devise controller
  def after_sign_in_path_for(_resource)
    user_path(current_user.username)
  end

  def after_update_path_for(_resource)
    user_path(current_user.username)
  end
end
