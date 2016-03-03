class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :update_sanitized_params, if: :devise_controller?
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

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

  private

  def record_not_found
    render text: t('404'), status: 404
  end
end
