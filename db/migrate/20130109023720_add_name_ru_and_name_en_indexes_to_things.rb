class AddNameRuAndNameEnIndexesToThings < ActiveRecord::Migration
  def change
    add_index :things, :name_ru
    add_index :things, :name_en
  end
end
