class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.references :repository

      t.string :scmid
      t.text :message

      t.integer :additions
      t.integer :deletions

      t.timestamp :time

      t.timestamps
    end
  end
end
