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

ActiveRecord::Schema.define(version: 20141109115008) do

  create_table "events", force: true do |t|
    t.string   "title"
    t.integer  "fav"
    t.datetime "date"
    t.string   "place"
    t.integer  "price"
    t.integer  "category"
    t.text     "description"
    t.string   "image_path"
    t.string   "host"
    t.string   "contact"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude",    limit: 24
    t.float    "longtitude",  limit: 24
  end

  create_table "favorites", force: true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menus", force: true do |t|
    t.integer  "restaurant_id"
    t.string   "food_name"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.integer  "category"
    t.float    "rate",            limit: 24
    t.string   "address"
    t.string   "image_path"
    t.string   "business_hours"
    t.string   "phone_number"
    t.string   "regular_holiday"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude",        limit: 24
    t.float    "longtitude",      limit: 24
  end

  create_table "reviews", force: true do |t|
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.integer  "rating"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "sex"
    t.integer  "student_id"
    t.string   "faculty"
    t.string   "entrance_year"
    t.string   "circle"
    t.integer  "info_source"
    t.string   "authentication_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
