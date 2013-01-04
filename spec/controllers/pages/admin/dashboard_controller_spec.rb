require 'spec_helper'

describe Pages::Admin::DashboardController do
  before do
    sign_in!
  end

  it "should show get :show" do
    get :show
    response.should be_success
  end
end
