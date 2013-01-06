# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130106085119) do

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "commits", :force => true do |t|
    t.integer  "repository_id"
    t.string   "scmid"
    t.text     "message"
    t.integer  "additions"
    t.integer  "deletions"
    t.datetime "time"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "contents", :force => true do |t|
    t.string   "alias_ru"
    t.string   "alias_en"
    t.string   "state"
    t.string   "title_ru"
    t.string   "title_en"
    t.text     "text_ru"
    t.text     "text_en"
    t.boolean  "en"
    t.boolean  "ru"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "symbolic_name"
    t.boolean  "predefined"
  end

  add_index "contents", ["alias_en"], :name => "index_contents_on_alias_en"
  add_index "contents", ["alias_ru"], :name => "index_contents_on_alias_ru"
  add_index "contents", ["symbolic_name"], :name => "index_contents_on_symbolic_name"

  create_table "repositories", :force => true do |t|
    t.string   "name"
    t.string   "source"
    t.string   "state"
    t.boolean  "ru"
    t.boolean  "en"
    t.text     "summary_ru"
    t.text     "summary_en"
    t.text     "description_ru"
    t.text     "description_en"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "author"
    t.string   "owner"
  end

  create_table "things", :force => true do |t|
    t.string   "name_ru"
    t.string   "name_en"
    t.text     "text_ru"
    t.text     "text_en"
    t.text     "summary_ru"
    t.text     "summary_en"
    t.boolean  "en"
    t.boolean  "ru"
    t.date     "date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "state"
  end

  create_table "users", :force => true do |t|
    t.string "login"
    t.string "password_digest"
    t.string "state"
  end

end
