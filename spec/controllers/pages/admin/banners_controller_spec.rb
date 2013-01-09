require 'spec_helper'

describe Pages::Admin::BannersController do
  before do
    sign_in!
    @banner = create :banner
  end

  it "should get :index" do
    get :index
    response.should be_success
  end

  it "should get :edit" do
    get :edit, :id => @banner
    response.should be_success
  end

  it "should get :new" do
    get :new
    response.should be_success
  end

  it "should patch a banner" do
    @new_message = "new_message"

    put :update, :id => @banner, :banner => { :message_ru => @new_message }
    response.should be_redirect
    @banner.reload
    @banner.message_ru.should == @new_message
  end

  it "should :create a banner" do
    @new_attributes = attributes_for(:banner)
    post :create, :banner => @new_attributes
    created_banner = Banner.where(:message_ru => @new_attributes[:message_ru]).first
    created_banner.should be
  end

  it "should :delete a banner" do
    delete :destroy, :id => @banner
    response.should be_redirect

    item = Banner.where(:id => @banner.id).first
    item.should_not be
  end
end
