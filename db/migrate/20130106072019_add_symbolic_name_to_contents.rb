class AddSymbolicNameToContents < ActiveRecord::Migration
  def change
    add_column :contents, :symbolic_name, :string
    add_index :contents, :symbolic_name
  end
end
