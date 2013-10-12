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
    current_user.destroy
    session.clear
    flash[:notice] = "Your user account has been deleted."
    redirect_to root_url

  end

  def edit
    # @user = User.find(params[:id])
    render :edit
  end

  def update
    current_user.update_attributes!(email: user_update[:email])
    redirect_to user_path(current_user)
  end

  def show
    user = User.find(params[:id])
    if user
      if params[:id].to_i != current_user.id
        flash[:notice] = "You can view your profile only."
        redirect_to user_path(current_user)
      end
      # will revisit the instance variable here
      @shared_slideshows = Slideshow.where("shared = true AND user_id NOT IN ( #{current_user.id} )")
    else
      flash[:notice] = "You need to be logged in to view your profile" #NOT RETURNING THIS NOTICE TO USER
      redirect_to login
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
