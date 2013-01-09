class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :alias_ru
      t.string :alias_en

      t.string :state

      t.string :title_ru
      t.string :title_en

      t.text :text_ru
      t.text :text_en

      t.boolean :en
      t.boolean :ru

      t.timestamps
    end
    
    add_index :contents, :alias_ru, :unique => true
    add_index :contents, :alias_en, :unique => true
  end
end
