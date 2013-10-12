require 'spec_helper'

  describe Element do

    context "Validations and Associations" do

        it "should belong to a slide" do
          user = Element.reflect_on_association(:slide)
          user.macro.should == :belongs_to
        end

        it "should belong to an element_type" do
          user = Element.reflect_on_association(:element_type)
          user.macro.should == :belongs_to
        end


  end
end


