require 'spec_helper'

describe SlideshowsController do

  describe '#new' do

    before do
      @slideshow = Slideshow.create
    end

    it "should allow us to add a new slideshow to the database" do
      expect(@slideshow).to be_an_instance_of(Slideshow)
    end

    it "should have default height of 720 (px)" do
      expect(@slideshow.px_height).to eq (720)
    end

    it "should have default height of 720 (px)" do
      expect(@slideshow.px_width).to eq (1280)
    end

    it "should have default 'shared' value of false" do
      expect(@slideshow.shared).to eq (false)
    end

    it "should allow to be past in a title" do
      slideshow = Slideshow.create(name: "This is a title")
      expect(slideshow.name).to eq("This is a title")
    end

  end

end
