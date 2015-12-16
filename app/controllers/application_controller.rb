class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  #before_action :devise_configure_permitted_parameters, if: :devise_controller?
	
  def after_sign_in_path_for(resource_or_scope)
    home_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
  
  private

    def after_invite_path_for(_resource)
      ideation_sessions_path
    end
end
