require 'spec_helper'

describe Pages::ThingsController do
  before do
    @thing = create :thing
  end

  it "should show get :show" do
    get :show, :id => @thing 
    response.should be_success
  end

  it "should get :index" do
    get :index
    response.should be_success
  end
end
