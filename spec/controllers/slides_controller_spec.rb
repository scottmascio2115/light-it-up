require 'spec_helper'

describe SlidesController do

  before do
    @user = User.create(email: 'user2@user2.com', password: 'password', password_confirmation: 'password')
    controller.stub(:current_user).and_return(@user)

    
    20.times do
      Slide.create(title: "test", user_id: @user.id, slideshow_id: 1, sort_order: 1)
    end

    @slide = Slide.create(title: 'test', slideshow_id: 1, user_id: 12345, sort_order: 1)  
  end

  describe '#index' do
    it 'should return all slides' do
      get 'index'
      expect(assigns(:slides).length).to eq(21)
    end
  end

  describe '#show' do
    
    before do
      get 'show', id: @slide.id
  	end 
    
    it 'should return an instance of slide' do
      
      expect(assigns(:slide)).to be_an_instance_of(Slide)
  	end
  end
  
  describe '#create' do
     it "should allow a title as an argument" do
       slide = Slide.create(title: "This is a title")
       expect(slide.title).to eq("This is a title")
    end
  end

  describe '#new' do

    before do
      get 'new'
    end
    
    it "should allow us to add a new slide to the database" do
      expect(assigns(:slide)).to be_an_instance_of(Slide)
    end
    
    it "should have a user_id" do
      expect(@slide.user_id).to eq(12345)
    end

    it "should have a slideshow_id" do
      expect(@slide.slideshow_id).to eq(1)
    end

  end

  describe '#edit' do

    it 'should render the edit page' do
      get :edit, :id => @slide.id

      response.should render_template(:edit)
    end
  end

  describe '#update' do
   it 'should update slide' do
      patch :update, id: @slide, slide: { :title => "title update" }

      @slide.reload.title.should eq "title update"
    end
  end


  # describe '#destroy' do
  #   it "should delete a slide" do
  #     delete :destroy, :id => @slide.id
  #   end
  # end

end