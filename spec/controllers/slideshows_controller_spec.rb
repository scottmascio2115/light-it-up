require 'spec_helper'

describe SlideshowsController do

  before do

    @user = User.create(email: "user1@user.com", password: "password", password_confirmation: "password")
    controller.stub(:current_user).and_return(@user)

    10.times do
      Slideshow.create(name: "test",user_id: @user.id)
    end

  end

  describe 'index' do

    it "should return one variable with all slideshows" do
      get 'index'
      expect(assigns(:slideshows).length).to eq(10)
    end

  end

  describe '#new' do

    before do
      get 'new'
    end

    it "should allow us to add a new slideshow to the database" do
      expect(assigns(:slideshow)).to be_an_instance_of(Slideshow)
    end

    it "should have default height of 720 (px)" do
      expect(assigns(:slideshow).px_height).to eq (720)
    end

    it "should have default height of 720 (px)" do
      expect(assigns(:slideshow).px_width).to eq (1280)
    end

    it "should have default 'shared' value of false" do
      expect(assigns(:slideshow).shared).to eq (false)
    end


  end

  describe '#create' do

    it "should allow to be past in a title" do
      slideshow = Slideshow.create(name: "This is a title")
      expect(slideshow.name).to eq("This is a title")
    end

  end

  describe '#show' do

    before do
      @slideshow = Slideshow.create(name: "test",user_id: 1234999)
      get 'show', id: @slideshow.id
    end

    it 'should return an instance of slideshow' do
      # expect(assigns(:slideshow)).to eq(@slideshow)
      expect(assigns(:slideshow)).to be_an_instance_of(Slideshow)
    end

    it 'should raise error if the slideshow is not shared and by another user' do
      # expect(assigns(:error)).to eq("Permission denied")
      flash.now[:error].should =~ /denied/i
    end

  end

  describe '#edit' do

    it 'should allow user to edit his own slideshow' do
      get 'edit', id: Slideshow.first.id
      expect(assigns(:slideshow)).to be_an_instance_of(Slideshow)
    end

    it 'should thorow error if trying to edit not owned and not shared slideshow' do
      @slideshow = Slideshow.create(name: "test",user_id: 1234999)
      get 'show', id: @slideshow.id
      flash.now[:error].should =~ /denied/i
    end

    it 'should allow to edit a shared but not owned slideshow' do
      @slideshow = Slideshow.create(name: "test",user_id: 1234999, shared: true)
      get 'show', id: @slideshow.id
      expect(assigns(:slideshow)).to be_an_instance_of(Slideshow)
    end

  end

  describe '#update' do

    it 'should allow a logged in user to edit his own slideshow' do
      @slideshow = Slideshow.first
      patch 'update', id: @slideshow, slideshow: {name: "Hello! testing"}
      expect(assigns(:slideshow).name).to eq("Hello! testing")
    end

    it 'throw error if shared is false and posting to not owned slideshow' do
      @slideshow = Slideshow.create(name: "test",user_id: 1234999)
      patch 'update', id: @slideshow, slideshow: {name: "Hello! testing"}
      flash.now[:error].should =~ /denied/i
    end

     it 'allow update of shared slideshow when not owner' do
      @slideshow = Slideshow.create(name: "test",user_id: 1234999, shared: true)
      patch 'update', id: @slideshow, slideshow: {name: "Hello! testing shared"}
      expect(assigns(:slideshow).name).to eq("Hello! testing shared")
    end


  end



end
