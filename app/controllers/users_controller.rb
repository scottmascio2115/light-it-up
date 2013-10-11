class UsersController < ApplicationController

  skip_before_filter :require_login, :only => [:new, :create]

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id

      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def new

  end

  def destroy

    @user = User.find(params[:id])
    if @user.id == session[:user_id]
      @user.destroy
      session.clear
    end
    redirect_to root_url

  end

  def update

    @user = User.find(params[:id])
    @user.update_attributes(user_params)

    redirect_to user_path(@user)
  end

  def edit

      @user = User.find(params[:id])



      render :edit
  end


  def show
    @user = User.find(params[:id])
    @slideshows = @user.slideshows
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
