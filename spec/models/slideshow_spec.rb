require 'spec_helper'

  describe Slideshow do

    context "Validations and Associations" do

       it "should have many slides" do
          slideshow = Slideshow.reflect_on_association(:slides)
          slideshow.macro.should == :has_many
        end

        it "should belong to a user" do
          slideshow = Slideshow.reflect_on_association(:user)
          slideshow.macro.should == :belongs_to
        end

        it "should have many elements" do
          slideshow = Slideshow.reflect_on_association(:elements)
          slideshow.macro.should == :has_many
        end

        it "should not have element types" do
          Slideshow.reflect_on_association(:element_types).should be_nil
        end

        it "has a creator and slideshow title and sorting order" do
          FactoryGirl.create(:slideshow).should be_valid
        end

        it "every slideshow requires a name" do
          FactoryGirl.build(:slideshow, name: nil).should_not be_valid
        end

        it "every slideshow needs to be created by someone" do
          FactoryGirl.build(:slideshow, user_id: nil).should_not be_valid
        end



    end
  end
