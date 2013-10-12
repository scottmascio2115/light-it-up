require 'spec_helper'

describe SlidesController do

  before do
    @user = User.create(email: 'user2@user2.com', password: 'password', password_confirmation: 'password')
    controller.stub(:current_user).and_return(@user)
    
    @user.slideshows << Slideshow.create(name: 'sstest')
    
    @ss = @user.slideshows.first

    5.times do
      @ss.slides << Slide.create(title: "test", creator_id: @user.id)
    end
    
  end

  describe '#index' do
    it 'should return all slides' do
      get 'index'
      expect(assigns(:slides).length).to eq(5)
    end
  end

  describe '#show' do

    before do
      slide = @ss.slides.last
      get 'show', id: slide.id

  	end

    it 'should return an instance of slide' do
      
      expect(assigns(:slide)).to be_an_instance_of(Slide)
  	end
  end

  describe '#create' do
    it "should allow a title as an argument" do
      slide = @ss.slides.last
      expect(slide.title).to eq("test")
    end
  end

  describe '#new' do

    before do
      @slide = @ss.slides.last
      get 'new', id: @slide.id
    end

    it "should allow us to add a new slide to the database" do
      expect(assigns(:slide)).to be_an_instance_of(Slide)
    end

    it "should have a creator_id" do
      expect(@slide.creator_id).to eq(Slide.last.creator_id)
    end

    it "should have a slideshow_id" do
      expect(@slide.slideshow_id).to eq(Slideshow.last.id)
    end

  end

  describe '#edit' do

    it 'should render the edit page' do
      @slide = @ss.slides.last
      get :edit, :id => @slide.id

      response.should render_template(:edit)
    end
  end

  describe '#update' do
   it 'should update slide' do
      
      slide = @ss.slides.last
      patch 'update', id: slide, slide: { title: "test2" }
      expect(assigns(:slide).title).to eq("test2")
      
    end
  end


  describe '#destroy' do
    before :each do
      @slide = @ss.slides.last
    end

    it "should delete a slide" do
      
      expect {
        delete :destroy, id: @slide
        }.to change(Slide, :count).by(-1)
      
    end
    
    it "redirects to slideshows#show" do
      
      delete :destroy, id: @slide
      response.should redirect_to slideshow_path(@ss)
    
    end

  end

end
