class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:first_name, :last_name,
               :email, :password, :encrypted_password)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:first_name, :last_name,
               :email, :password, :encrypted_password)
    end
  end
  protect_from_forgery with: :exception
end
