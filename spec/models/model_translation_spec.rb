require 'spec_helper'

describe "ModelTranslation in ActiveRecord model instance" do
  it "should find translated method" do
    w = Work.new
    w.respond_to?(:name).should be_true
    expect { w.name }.to_not raise_error
  end
end
