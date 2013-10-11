require 'spec_helper'

describe ElementsController do

  before do
      @slide = Slide.create(title: 'Slide 1', slideshow_id: 1, user_id: 1, sort_order: 1)
    end

  describe '#index' do

    it 'should access all elements' do
      elements = Element.all
      expect elements.to eq Element.all
    end

  end
  
  describe '#create' do

    it 'should create a new element' do
      element = Element.create(content: 'Hello, world!', slide_id: 1, element_type_id: 1)
      expect element.to be Element
    end

    it 'should require a title, slidehow_id, user_id and a sort_order' do
      element = Element.create(content: 'Not a slide')
      expect element.to_not be Element
    end
  end

  describe '#new' do
    
  end

  describe '#show' do
  end

  describe '#edit' do
  end

  describe '#update' do
  end
  
  describe '#destroy' do
  end

end