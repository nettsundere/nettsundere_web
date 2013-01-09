require 'spec_helper'

describe Api::RepositoriesController do
  before do
    I18n.stub(:locale).and_return(:en)
    @repository = create :published_repository, :source => "github"
  end

  it "should show get :show" do
    get :show, :id => @repository.id, :format => "json"
    response.should be_success
  end
end
