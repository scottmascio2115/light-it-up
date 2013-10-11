class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  before_filter :require_login

  def require_login
    redirect_to root_url unless current_user
  end

  helper_method :id_check

  def id_check(id)
    if current_user.id == id
      true
    else
      false
    end
  end
  

end
