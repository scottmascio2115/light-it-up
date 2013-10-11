module UserHelper

  def sign_up
    @user = User.create(:email => "ex@fake.com", :password => "password", :password_confirmation => "password")
    visit root_path
    #save_and_open
    fill_in 'email', with: 'ex@fake.com'
    fill_in 'password', with: 'password'
    click_button 'Log in'
  end
end


# to use launchy put
#save_and_open_page
# into a route you want to inspect see above for example
