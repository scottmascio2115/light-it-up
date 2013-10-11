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
      # visit user_path(User.find_by_email("ex@fake.com"))
      @user = User.find_by_email("ex@fake.com")
      @your_slideshow = Slideshow.create(name: "your slideshow",user_id: @user.id, shared: false)
      @another_user = User.create(email:"mark@dev.com", password: "password", password_confirmation: "password")
      @shared_slideshow = Slideshow.create(name: "shared slideshow",user_id: @another_user.id, shared: true)
      visit user_path(@user)
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

    it "Can view 'your slideshows' table partial" do
      # save_and_open_page
      click_link 'your slideshow'
      page.should have_content 'your slideshow'
    end

    it "Can view 'shared slideshows' table partial" do
      click_link 'shared slideshow'
      page.should have_content 'shared slideshow'
    end

  end

end


