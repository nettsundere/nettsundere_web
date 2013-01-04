class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :name
      t.string :source
      t.string :state

      t.boolean :ru
      t.boolean :en

      t.text :summary_ru
      t.text :summary_en

      t.text :description_ru
      t.text :description_en

      t.timestamps
    end
  end
end
