require 'spec_helper'

describe Pages::Admin::ContentsController do
  before do
    sign_in!
    @content = create :content
  end

  it "should get :index" do
    get :index
    response.should be_success
  end

  it "should get :edit" do
    get :edit, :id => @content
    response.should be_success
  end

  it "should get :new" do
    get :new
    response.should be_success
  end

  it "should patch a content" do
    @new_title = "new_title"

    put :update, :id => @content, :content => { :title_ru => "new_title" }
    response.should be_redirect
    @content.reload
    @content.title_ru.should == @new_title
  end

  it "should :create a content" do
    @new_attributes = attributes_for(:content)
    post :create, :content => @new_attributes
    created_content = Content.where(:title_ru => @new_attributes[:title_ru]).first
    created_content.should be
  end

  it "should :delete a content" do
    delete :destroy, :id => @content
    response.should be_redirect

    item = Content.where(:id => @content.id).first
    item.should_not be
  end
end
