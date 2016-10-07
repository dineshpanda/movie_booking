class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_params, if: :devise_controller?
  
  protected

  def devise_signup_attributes
    %w(email name password password_confirmation gender)
  end

  def configure_permitted_params
    devise_parameter_sanitizer.for(:sign_up) do |params| 
      params.permit(devise_signup_attributes)
    end
  end
  
end
