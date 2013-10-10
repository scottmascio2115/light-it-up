class SlideshowsController < ApplicationController

  def index
    @slideshows = Slideshow.all
  end

  def create

  end

  def new
    @slideshow = Slideshow.new
  end

  def edit
  end

  def show
    @slideshow = Slideshow.find(params[:id])
    if @slideshow.shared || @slideshow.user_id == current_user.id
      @slideshow
    else
      flash[:error] = "Permission Denied"
    end
  end

  def update

  end

  def destroy
  end

end
