require 'spec_helper'

  describe User do

    context "Validations and Associations" do

      it "should have many slides" do
        user = User.reflect_on_association(:slides)
        user.macro.should == :has_many
      end

      it "should have many slidesshows" do
        user = User.reflect_on_association(:slideshows)
        user.macro.should == :has_many
      end

      it "should not have many elements" do
         User.reflect_on_association(:element).should be_nil
      end

      it "has a vaild email and password" do
        FactoryGirl.create(:user).should be_valid
      end

      it "should not be vaild unless password it 8 characters" do
        FactoryGirl.build(:user, password: "dog").should_not be_valid
      end

      it "password should not be valid if they dont match" do
        FactoryGirl.build(:user, password: "dog").should_not be_valid
      end

      it "should not be valid without an email" do
        FactoryGirl.build(:user, email: nil).should_not be_valid
      end

      it  "does not let you create a user without a unique email" do
        user = FactoryGirl.create(:user)
        FactoryGirl.create(:user, email: "scott@gmail.com")
        FactoryGirl.build(:user, email: "scott@gmail.com").should_not be_valid
      end

      it "should not create a user without proper email syntax" do
        FactoryGirl.build(:user, email: 'bob.com').should_not be_valid
      end

      it "validates the presence of a password" do
        FactoryGirl.build(:user, password: nil).should_not be_valid
      end

      it "validates that the password and password confirmation are the same" do
        FactoryGirl.build(:user, password: "not password").should_not be_valid
      end

    end
  end


