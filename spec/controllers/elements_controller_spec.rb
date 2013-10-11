require 'spec_helper'

describe ElementsController do

  before do
    @slide = Slide.create!(title: 'Slide 1', slideshow_id: 1, user_id: 1, sort_order: 1)
  end

  describe '#index' do

    it 'should access all elements' do
      elements = Element.all
      expect(elements).to eq Element.all
    end

  end
  
  describe '#create' do

    it 'should create a new element' do
      element = Element.create!(content: 'Hello, world!', slide_id: 1, element_type_id: 1)
      expect(element.class).to be Element
    end

    it 'should require a title, slidehow_id, user_id and a sort_order' do
      element = Element.new(content: 'Not a slide')
      expect{ element.save }.to_not change(Element, :count).by(1)
    end

  end

  describe '#new' do
    
    it 'should open a new element object' do
      element = Element.new
      expect(element.class).to be Element      
    end

    it 'should not save an Element object' do
      expect{ Element.new }.to_not change(Element, :count).by(1)
    end

  end

  describe '#show' do

    before do
      element = Element.create(content: 'Hello, world!', slide_id: 1, element_type_id: 1, size: 0, coordinates: 'xxx')
      get 'show', :id => element.id
    end

    it 'should return an element' do
      # (expect(assigns(:element)).to be_a(Element))
      pending "This test sucks"
    end

  end

  describe '#edit' do

    before do
      @element = Element.create(content: 'Hello, world!', slide_id: 1, element_type_id: 1)
    end

    it 'should allow a user to edit an element' do
      # get 'edit', id: Element.first.id
      # expect(assigns(:element)).to be_an_instance_of(Element)
      pending "Test for element editing"
    end

    it 'should throw error if trying to edit an element belonging to other user' do
      pending "Test for editing element"
    end

    it 'should allow to edit a shared but not owned slideshow' do
      pending "Test for editing element"
    end

  end

  describe '#update' do
  end
  
  describe '#destroy' do
  end

end