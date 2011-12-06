require File.expand_path("../../spec_helper", __FILE__)

describe Helpers::A do
  before :each do
    @helper = Class.send(:include, Helpers::A).new
    @helper.stub!(:page).and_return :current_page
  end

  describe "when current page isn't same as linked" do
    it "should return link" do
      @helper.should_receive(:haml).with("%a{{:href=>\"aaaa\"}}some title").once
      @helper.a_if_not(:some_page_name, "some title", :href => "aaaa")
    end
  end  
  
  describe "when current page is same with linked page" do  
    it "shouldn't return link when current page is linked" do
      @helper.should_receive(:haml).with("%span.current some title").once
      @helper.a_if_not(:current_page, "some title", :href => "aaaa")
    end
  end
end
