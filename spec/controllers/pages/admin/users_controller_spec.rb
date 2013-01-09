require 'spec_helper'

describe Pages::Admin::UsersController do
  before do
    sign_in!
    @user = create :user
  end

  it "should get :index" do
    get :index
    response.should be_success
  end

  it "should get :edit" do
    get :edit, :id => @user
    response.should be_success
  end

  it "should get :new" do
    get :new
    response.should be_success
  end

  it "should patch a user" do
    @new_login = "new_login"

    put :update, :id => @user, :user => { :login => "new_login" }
    response.should be_redirect
    @user.reload
    @user.login.should == @new_login
  end

  it "should :create a user" do
    @new_attributes = attributes_for(:user)
    post :create, :user => @new_attributes
    created_user = User.where(:login => @new_attributes[:login]).first
    created_user.should be
  end

  it "should :delete a user" do
    delete :destroy, :id => @user
    response.should be_redirect

    item = User.where(:id => @user.id).first
    item.should_not be
  end
end
