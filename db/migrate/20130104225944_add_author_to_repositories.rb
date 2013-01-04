class AddAuthorToRepositories < ActiveRecord::Migration
  def change
    add_column :repositories, :author, :string
  end
end
