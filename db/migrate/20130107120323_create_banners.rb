class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.boolean :ru
      t.boolean :en

      t.text :message_ru
      t.text :message_en

      t.string :state

      t.timestamps
    end
  end
end
