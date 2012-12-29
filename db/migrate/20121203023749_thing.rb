class Thing < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string :name_ru
      t.string :name_en

      t.text :text_ru
      t.text :text_en

      t.text :summary_ru
      t.text :summary_en

      t.date :date

      t.timestamps
    end
  end
end
