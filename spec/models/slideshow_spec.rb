require 'spec_helper'

  describe Slideshow do

    context "Validations and Associations" do

       it "should have many slides" do
          user = Slideshow.reflect_on_association(:slides)
          user.macro.should == :has_many
        end

        it "should belong to a user" do
          user = Slideshow.reflect_on_association(:user)
          user.macro.should == :belongs_to
        end

        it "should have many elements" do
          user = Slideshow.reflect_on_association(:elements)
          user.macro.should == :has_many
        end












    end
  end
