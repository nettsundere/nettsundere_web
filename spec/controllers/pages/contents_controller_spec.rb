require 'spec_helper'

describe Pages::ContentsController do
  before do
    I18n.stub(:locale).and_return(:en)
    @content = create :published_content, :alias_en => "resume"
  end

  it "should show get :show" do
    get :show, :id => "resume"
    response.should be_success
  end
end
