module UserHelper
  def sign_up
    @user = User.create(:email => "ex@fake.com", :password => "abc123", :password_confirmation => "abc123")
    visit login_path
    fill_in 'email', with: 'ex@fake.com'
    fill_in 'password', with: 'abc123'
    click_button 'Log in'
  end
end
