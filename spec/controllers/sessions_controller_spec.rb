require 'spec_helper'

describe SessionsController do

  describe '#create' do
    
    before(:each) do
      @user = User.create!(email: "user1@user.com", password: "password", password_confirmation: "password")
    end

    it "sets the user_id in the session on successful login" do
      post :create, { email: @user.email, password: "password"}
      expect(session[:user_id]). to eq @user.id
    end

  end

end
