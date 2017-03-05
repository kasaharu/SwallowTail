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

ActiveRecord::Schema.define(version: 20170305055939) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "keyword_replies", force: :cascade do |t|
    t.string   "keyword",    null: false
    t.string   "reply_type", null: false
    t.string   "reply_word", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["keyword"], name: "index_keyword_replies_on_keyword", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",               default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

end
