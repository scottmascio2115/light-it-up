class UsersController < ApplicationController

  skip_before_filter :require_login, :only => [:new, :create]

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def new

  end

  def destroy
    
    if current_user.id == params[:id].to_i
      current_user.destroy
      session.clear
      flash[:notice] = "Your user account has been deleted."
      redirect_to root_url
    else
      flash[:notice] = "You can only delete your own account."
      redirect_to user_path(current_user)
    end
  end

  def edit
    render :edit
  end

  def update
    if current_user.id == params[:id].to_i
      current_user.update_attributes!(email: user_update[:email])
      flash[:notice] = "Your email has been updated."
      redirect_to user_path(current_user)
    else
      #need to revisit this but the check works
      flash[:notice] = "You can only update your own account."
      session.clear
      redirect_to root_url
    end
      # redirect_to user_path(current_user)
  end

  def show
    if current_user.id == params[:id].to_i
      @shared_slideshows = Slideshow.where("shared = true AND user_id NOT IN ( #{current_user.id} )")
    else
      flash[:notice] = "You can view your profile only."
      redirect_to user_path(current_user)
    end

  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def user_update
    params.require(:user).permit(:email)
  end

end
