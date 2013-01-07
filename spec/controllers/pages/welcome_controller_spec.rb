require 'spec_helper'

describe Pages::WelcomeController do
  before do
    create :published_banner
  end

  it "should show get :show" do
    get :show
    response.should be_success
  end
end
