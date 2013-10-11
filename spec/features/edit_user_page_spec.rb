require 'spec_helper'
include UserHelper



describe "Edit User Page" do

  before(:each) do
    sign_up
  end

  it "should show edit page" do
    visit edit_user_path(User.find_by_email("ex@fake.com"))
    page.should have_content "Edit Account info."
  end

  it "It has link to Log out" do
    click_link 'Log out'
    page.should have_content 'Welcome to CromeCast Hack'
  end

  it "Should edit the user info" do
    visit edit_user_path(User.find_by_email("ex@fake.com"))
    fill_in 'Email', with: 'editemail@fake.com'
    click_button 'Save User'
    page.should have_content "editemail@fake.com"
  end



end

