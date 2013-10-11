class SlideshowsController < ApplicationController

  def index
    @slideshows = Slideshow.all
  end

  def create
    @slideshow = Slideshow.new(create_params)
    @slideshow.user = current_user
    if @slideshow.save
      redirect_to slideshow_path(@slideshow)
    else
      render :new
    end
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

  private

  def create_params
    params.require(:slideshow).permit(:name, :shared)
  end

end
