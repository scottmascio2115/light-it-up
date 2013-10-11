class ElementsController < ApplicationController

  def index
    @elements = Element.all
  end

  def create
    @element = Element.new(create_params)
    redirect_to slide_path(@slide)
  end

  def new
    @element = Element.new    
  end

  def show
    @element = Element.find(params[:id])
  end

  def update
    
  end

  def edit
    
  end

  def destroy
    
  end


  private

  def create_params
    params.require(:element).permit(:content, :slide_id, :element_type_id, :size, :coordinates)
  end

end