require 'spec_helper'
include UserHelper

describe "User Profile" do

  before(:each) do
    sign_up
  end

  it "should show email" do
    visit user_path(User.find_by_email("ex@fake.com"))
    page.should have_content "Ex@fake.com"
  end

  describe "Profile functionality" do
    before(:each) do
      visit user_path(User.find_by_email("ex@fake.com"))
    end

    it "Can get to new slideshow page" do
      click_link 'Create new slideshow'
      page.should have_content 'slideshow'
    end

    it "Can get to new slideshow page" do
      click_link 'Homepage'
      page.should have_content 'Welcome to CromeCast Hack'
    end

    it "Can get to update page" do
      click_link 'Update Account Info'
      page.should have_content 'Edit Account info.'
    end

    it "It has link to Delete account" do
      click_link 'Delete Account'
      page.should have_content 'Welcome to CromeCast Hack'
    end
  end
end


