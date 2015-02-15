class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  def after_sign_up_path_for(resource)
    # after_sign_in_path_for(resource)
    '/set-location'
  end

  protected

  def configure_permitted_parameters 
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(*%i[username email goal age sex description level password password_confirmation remember_me])
    end

    devise_parameter_sanitizer.for(:sign_in) do |u| 
      u.permit(*%i[login username email password remember_me])
    end

    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :goal, :email, :password, :description, :level, :password_confirmation, :current_password) }
  end


  
end
