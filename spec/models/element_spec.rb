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
  end
end


