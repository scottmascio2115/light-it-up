class SlidesController < ApplicationController

  def index
    @slides = Slide.all
  end

  def create
    @slide = Slide.new(create_params)
    @slide.user = current_user
    if @slide.save
      redirect_to slide_path(@slide)
    else
      render :new
    end
  end
  
  def new
    @slide = Slide.new
  end

  def edit
    @slide = Slide.find(params[:id])

    render :edit  

  end

  def show
    @slide = Slide.find(params[:id])
    if @slide.user_id == current_user.id
      @slide
    else
      flash[:error] = "Permission Denied"
    end
  end
  
  def update
    slide = Slide.find(params[:id])
    slide.update_attributes()
  
  end

  def destroy
    slideshow_id = slide.slideshow_id
    @slideshow = Slideshow.find(slideshow_id)
    slide = Slide.find(params[:id])
    slide.destroy

    redirect_to slideshow_path(@slideshow)
  end

  private

  def create_params
    params.require(:slide).permit(:title, :sort_order)
  end

end