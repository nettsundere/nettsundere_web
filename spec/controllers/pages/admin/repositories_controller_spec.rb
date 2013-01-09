require 'spec_helper'

describe Pages::Admin::RepositoriesController do
  before do
    sign_in!
    @repository = create :repository
  end

  it "should get :index" do
    get :index
    response.should be_success
  end

  it "should get :edit" do
    get :edit, :id => @repository
    response.should be_success
  end

  it "should get :new" do
    get :new
    response.should be_success
  end

  it "should patch a repository" do
    @new_name = "new_name"

    put :update, :id => @repository, :repository => { :name => "new_name" }
    response.should be_redirect
    @repository.reload
    @repository.name.should == @new_name
  end

  it "should :create a repository" do
    @new_attributes = attributes_for(:repository)
    post :create, :repository => @new_attributes
    created_repository = Repository.where(:name => @new_attributes[:name]).first
    created_repository.should be
  end

  it "should :delete a repository" do
    delete :destroy, :id => @repository
    response.should be_redirect

    item = Repository.where(:id => @repository.id).first
    item.should_not be
  end
end
