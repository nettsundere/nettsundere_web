require 'spec_helper'

describe Pages::WelcomeController do
  it "should show get :show" do
    get :show
    response.should be_success
  end
end
