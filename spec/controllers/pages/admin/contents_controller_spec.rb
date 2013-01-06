require 'spec_helper'

describe Pages::Admin::ContentsController do
  before do
    sign_in!
  end

  describe "not a predefined content" do
    subject { create :content }

    it "should get :index" do
      get :index
      response.should be_success
    end

    it "should get :edit" do
      get :edit, :id => subject
      response.should be_success
    end

    it "should get :new" do
      get :new
      response.should be_success
    end

    it "should patch a content" do
      @new_title = "new_title"

      put :update, :id => subject, :content => { :title_ru => "new_title" }
      response.should be_redirect
      subject.reload
      subject.title_ru.should == @new_title
    end

    it "should :create a content" do
      @new_attributes = attributes_for(:content)
      post :create, :content => @new_attributes
      created_content = Content.where(:title_ru => @new_attributes[:title_ru]).first
      created_content.should be
    end

    it "should :delete a content" do
      delete :destroy, :id => subject
      response.should be_redirect

      item = Content.where(:id => subject.id).first
      item.should_not be
    end
  end

  describe "predefined content" do
    subject { create :content, :predefined => true }

    it "cannot be deleted" do
      delete :destroy, :id => subject
      response.should be_redirect
      item = Content.where(:id => subject.id).first
      item.should be
    end

    it "cannot change its symbolic_name" do
      put :update, :id => subject, :content => {:symbolic_name => "123"}
      response.should be_redirect
      subject.reload
      subject.symbolic_name.should_not == "123"
    end
  end
end
