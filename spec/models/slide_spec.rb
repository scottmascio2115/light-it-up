require 'spec_helper'

  describe Slide do

    context "Validations and Associations" do

        it "should belong to a slideshow" do
          user = Slide.reflect_on_association(:slideshow)
          user.macro.should == :belongs_to
        end

        it "should belong to a user" do
          user = Slide.reflect_on_association(:creator)
          user.macro.should == :belongs_to
        end

        it "should have many elements" do
          user = Slide.reflect_on_association(:elements)
          user.macro.should == :has_many
        end









    end
  end
