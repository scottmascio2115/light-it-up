require 'spec_helper'
describe UsersController do

  before(:each) do
    @user = User.create(:email => "scott@gmail.com",:password => "test", :password_confirmation => "test" )

    controller.stub(:current_user).and_return(@user)

  end

  describe '#create' do

   it 'creats a new user ' do
    @user.should be_an_instance_of User
  end

   it "should be able to create a user" do
    expect { post 'create' , :user => {"email" => "scott@gmail.com",
                                       "password" => "test",
                                       "password_confirmation" => "test" } }.to change(User, :count).by(1)
     response.should redirect_to(user_path(session[:user_id]))
   end

   it "should set session id" do
     expect { post 'create' , :user => {"email" => "scott@gmail.com",
                                       "password" => "test",
                                       "password_confirmation" => "test" } }.to change(User, :count).by(1)
     session[:user_id].should eq User.last.id
   end

   it "should not be able to create a user without matching passwords" do
     expect { post 'create' , :user => {"email" => "scott@gmail.com",
                                       "password" => "test",
                                       "password_confirmation" => "not test" } }.to_not change(User, :count).by(1)
      session[:user_id].should eq (nil)
      response.should render_template(:new)
   end

   it "should not be able to create a user without email" do
      expect { post 'create' , :user => {"email" => "",
                                       "password" => "test",
                                       "password_confirmation" => "not test" } }.to_not change(User, :count).by(1)
      session[:user_id].should eq (nil)
      response.should render_template(:new)
   end

    it "should not be able to create a user without password" do
      expect { post 'create' , :user => {"email" => "scott@gmail.com",
                                         "password" => "",
                                         "password_confirmation" => "not test" } }.to_not change(User, :count).by(1)
      session[:user_id].should eq (nil)
      response.should render_template(:new)
   end

   it "should render create view" do
    get 'new'

    response.should render_template(:new)
   end

   it "should show the profile view" do
      get :show, :id => @user.id

      response.should render_template(:show)
   end

end

  describe '#destroy' do
    it "should let the user delete their own account" do

      delete :destroy, :id => @user.id
    end
  end

  describe '#edit' do

    it 'should render the edit page' do
      get :edit, :id => @user.id

      response.should render_template(:edit)
    end
  end

  describe '#update' do

    it 'should update email' do
      patch :update, id: @user, user: {:email => "test@test.com"}

      @user.reload.email.should == "test@test.com"
    end
  end

end

