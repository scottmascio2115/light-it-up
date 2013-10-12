require 'spec_helper'


  describe Element do

    context "Validations and Associations" do

        it "should belong to a slide" do
          element_type = ElementType.reflect_on_association(:elements)
          element_type.macro.should == :has_many
        end

        it "should belong to an element_type" do
          element_type = ElementType.reflect_on_association(:slides)
          element_type.macro.should == :has_many
        end

        it "should not have users" do
          ElementType.reflect_on_association(:user).should be_nil
        end

    end
  end



