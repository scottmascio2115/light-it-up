class SlidesController < ApplicationController

  def index
    @slides = Slide.all
  end

  def create
    @slide = Slide.new(create_params)
    # @slide.slideshow_id = current_slideshow
    @slide.creator = current_user
    if @slide.save
      current_slideshow.slides << @slide
      redirect_to slide_path(@slide)
    else
      # puts "error...this did not work."
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
    @slideshow = Slideshow.find(@slide.slideshow_id)
    if @slide.creator_id == current_user.id
      @slide
      @element_types = ElementType.all
    else
      flash[:error] = "Permission Denied"
    end
  end

  def update
    @slide = Slide.find(params[:id])
    @slide.update_attributes(update_params)
    slideshow_id = @slide.slideshow_id
    @slideshow = Slideshow.find(slideshow_id)
    redirect_to slideshow_path(@slideshow)
  end

  def destroy
    slide = Slide.find(params[:id])
    slideshow_id = slide.slideshow_id
    @slideshow = Slideshow.find(slideshow_id)
    slide.destroy

    redirect_to slideshow_path(@slideshow)
  end

  private

  def create_params
    params.require(:slide).permit(:title, :sort_order)
  end


  def update_params
    params.require(:slide).permit(:title, :sort_order)
  end
end
