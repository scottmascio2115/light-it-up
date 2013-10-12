require 'spec_helper'

  describe Slide do

    context "Validations and Associations" do

        it "should belong to a slideshow" do
          slide = Slide.reflect_on_association(:slideshow)
          slide.macro.should == :belongs_to
        end

        it "should belong to a user" do
          slide = Slide.reflect_on_association(:creator)
          slide.macro.should == :belongs_to
        end

        it "should have many elements" do
          slide = Slide.reflect_on_association(:elements)
          slide.macro.should == :has_many
        end

        it "should not have element types" do
          Slide.reflect_on_association(:element_types).should be_nil
        end

        it "has a creator and slideshow title and sorting order" do
          FactoryGirl.create(:slide).should be_valid
        end

        it "should not be vaild it has a title" do
          FactoryGirl.build(:slide, title: nil).should_not be_valid
        end

        it "every slide needs a creator" do
          FactoryGirl.build(:slide, creator_id: nil).should_not be_valid
        end








    end
  end
