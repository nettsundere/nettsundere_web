require 'spec_helper'

describe Pages::Admin::ThingsController do
  before do
    @thing = create :thing
  end

  it "should get :index" do
    get :index
    response.should be_success
  end

  it "should get :edit" do
    get :edit, :id => @thing
    response.should be_success
  end

  it "should get :new" do
    get :new
    response.should be_success
  end

  it "should patch a thing" do
    @new_name = "new_name"

    put :update, :id => @thing, :thing => { :name_ru => "new_name" }
    response.should be_redirect
    @thing.reload
    @thing.name_ru.should == @new_name
  end

  it "should :create a thing" do
    @new_attributes = attributes_for(:thing)
    post :create, :thing => @new_attributes
    created_thing = Thing.where(:name_ru => @new_attributes[:name_ru]).first
    created_thing.should be
  end

  it "should :delete a thing" do
    delete :destroy, :id => @thing
    response.should be_redirect

    item = Thing.where(:id => @thing.id).first
    item.should_not be
  end
end
