class SessionsController < ApplicationController


 skip_before_filter :require_login #, :id_check


  def create

    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:notice] = 'Invalid email or password' 
      redirect_to root_url
    end
  end


  def destroy
    session.clear
    flash[:notice] = 'You have successfully logged out.'
    redirect_to root_url
  end

end
