require 'spec_helper'

describe Pages::SessionsController do
  include Authorization::Controller

  before do
    @user = create :enabled_user
  end

  it "should show get :new" do
    get :new 
    response.should be_success
  end

  it "should create a session" do
    auth_data = {
      :login => @user.login,
      :password => @user.password,
      :password_confirmation => @user.password
    }

    signed_in?.should_not be
    post :create, :user => auth_data
    response.should be_redirect
    signed_in?.should be
  end

  it "should sign out" do
    sign_in!
    delete :destroy
    signed_in?.should_not be
  end
end
