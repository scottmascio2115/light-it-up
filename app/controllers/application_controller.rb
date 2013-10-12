class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :current_slideshow
  helper_method :id_check
  before_filter :require_login

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    redirect_to root_url unless current_user
  end

  def id_check(id)
    if current_user.id == id
      true
    else
      false
    end
  end
  
  def current_slideshow
    current_slideshow = Slideshow.find(session[:slideshow_id]) if session[:slideshow_id]
  end

end
