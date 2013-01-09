require 'spec_helper'

describe "ModelTranslation in ActiveRecord model instance" do
  before do
    create_list(:thing, 3)
    I18n.locale = :en
  end

  it "should find translated method" do
    w = Thing.new
    w.respond_to?(:name).should be_true
    expect { w.name }.to_not raise_error
  end

  it "can select localized" do
    expect { Thing.version(:ru) }.to_not raise_error
    expect { Thing.localized }.to_not raise_error    
  end

  it "can translate method name" do
    Thing.localized_name(:name).should == :name_en
    Thing.localized_name(:name, :ru).should == :name_ru
  end
end
