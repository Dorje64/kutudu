class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

   def configure_permitted_parameters
     # @group = Group.find_by_groupname(params[:group])
     # @group = @group.id
    devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:sign_up) << :group_id
    #devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email) }
  end
end
