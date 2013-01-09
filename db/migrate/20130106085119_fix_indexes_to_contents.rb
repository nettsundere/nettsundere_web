class FixIndexesToContents < ActiveRecord::Migration
  def up
    remove_index :contents, :alias_ru
    remove_index :contents, :alias_en
    add_index :contents, :alias_ru
    add_index :contents, :alias_en
  end

  def down
    remove_index :contents, :alias_ru
    remove_index :contents, :alias_en
    add_index :contents, :alias_ru, :unique => true
    add_index :contents, :alias_en, :unique => true
  end
end
