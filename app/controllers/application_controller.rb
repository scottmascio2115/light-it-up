class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  before_filter :require_login #, :id_check

  def require_login
  # p current_user
    redirect_to root_url unless current_user 
  end

  # def id_check
  #   redirect_to user_path(current_user.id) unless current_user.id == params[:id]
  # end
  

end
