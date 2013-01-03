require 'spec_helper'

describe Pages::Admin::DashboardController do
  it "should show get :show" do
    get :show
    response.should be_success
  end
end
