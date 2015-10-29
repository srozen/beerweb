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

ActiveRecord::Schema.define(version: 20151029141244) do

  create_table "beer_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "beers", force: :cascade do |t|
    t.string   "name"
    t.float    "degree"
    t.text     "description"
    t.text     "story"
    t.integer  "beer_category_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "beers", ["beer_category_id"], name: "index_beers_on_beer_category_id"
  add_index "beers", ["name"], name: "index_beers_on_name", unique: true

  create_table "collections", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "collections", ["user_id"], name: "index_collections_on_user_id"

  create_table "contacts", force: :cascade do |t|
    t.string   "email"
    t.text     "subject"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friend_statuses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendlists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friends", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.float    "note"
    t.text     "comment"
    t.integer  "collection_id"
    t.integer  "beer_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "reviews", ["beer_id"], name: "index_reviews_on_beer_id"
  add_index "reviews", ["collection_id"], name: "index_reviews_on_collection_id"

  create_table "users", force: :cascade do |t|
    t.string   "login"
    t.string   "password"
    t.string   "salt"
    t.string   "email"
    t.string   "firstName"
    t.string   "lastName"
    t.date     "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["login"], name: "index_users_on_login", unique: true

end
