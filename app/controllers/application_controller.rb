class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname, :about, :gender_id, :avatar, :cover])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :surname, :about, :gender_id, :avatar, :cover])
  end

end
