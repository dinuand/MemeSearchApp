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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141214093237) do

  create_table "keywords", force: true do |t|
    t.string   "key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mappings", force: true do |t|
    t.integer  "meme_id"
    t.integer  "keyword_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memes", force: true do |t|
    t.string   "title"
    t.text     "keywords"
    t.string   "url"
    t.float    "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memes", ["keywords"], name: "index_on_memes_keywords"
  add_index "memes", ["rating"], name: "index_on_memes_rating"
  add_index "memes", ["title"], name: "index_on_memes_titles"
  add_index "memes", ["url", "keywords"], name: "unique_index_on_url_and_keywords", unique: true
  add_index "memes", ["url", "rating"], name: "unique_index_on_url_and_rating", unique: true
  add_index "memes", ["url", "title"], name: "unique_index_on_url_and_title", unique: true
  add_index "memes", ["url"], name: "index_on_memes_url"

end
