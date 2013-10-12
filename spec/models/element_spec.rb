require 'spec_helper'

  describe Element do

    context "Validations and Associations" do

        it "should belong to a slide" do
          element = Element.reflect_on_association(:slide)
          element.macro.should == :belongs_to
        end

        it "should belong to an element_type" do
          element = Element.reflect_on_association(:element_type)
          element.macro.should == :belongs_to
        end

        it "should not have any users" do
          Element.reflect_on_association(:user).should be_nil
        end

        it "should be valid if it has a slide id, element id, content, size and coordinates" do
          FactoryGirl.create(:element).should be_valid
        end

        it "every element needs a slide to be in" do
          FactoryGirl.build(:element, slide_id: nil).should_not be_valid
        end

        it "every element needs a content" do
          FactoryGirl.build(:element, content: nil).should_not be_valid
        end

        it "every element to have element types in it" do
          FactoryGirl.build(:element, element_type_id: nil).should_not be_valid
        end
  end
end


