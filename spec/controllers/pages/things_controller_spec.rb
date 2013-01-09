require 'spec_helper'

describe Pages::ThingsController do
  before do
    I18n.stub(:locale).and_return(:en)
    create_list(:published_thing, 3)
    @thing = create :published_thing
  end

  it "should show get :show" do
    get :show, :id => @thing.name_en
    response.should be_success
  end

  it "should get :index" do
    get :index
    response.should be_success
  end
end
