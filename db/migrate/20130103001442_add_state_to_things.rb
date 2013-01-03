class AddStateToThings < ActiveRecord::Migration
  def change
    add_column :things, :state, :string

    Thing.update_all(:state => "hidden")
  end
end
