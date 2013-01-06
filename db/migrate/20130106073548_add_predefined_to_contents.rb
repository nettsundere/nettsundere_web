class AddPredefinedToContents < ActiveRecord::Migration
  def change
    add_column :contents, :predefined, :boolean
  end
end
