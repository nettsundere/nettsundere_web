class AddPredefinedContents < ActiveRecord::Migration
  def up
    Content.create!(:symbolic_name => :resume, :predefined => true)
    Content.create!(:symbolic_name => :contacts, :predefined => true)
  end

  def down
    Content.with_name(:resume).first.destroy
    Content.with_name(:contacts).first.destroy
  end
end
