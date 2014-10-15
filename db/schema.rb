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

ActiveRecord::Schema.define(version: 20141015055123) do

  create_table "events", force: true do |t|
    t.string   "title"
    t.integer  "fav"
    t.datetime "date"
    t.string   "place"
    t.integer  "price"
    t.integer  "type"
    t.text     "description"
    t.string   "image_path"
    t.string   "host"
    t.string   "contact"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.integer  "type"
    t.float    "rate",            limit: 24
    t.string   "address"
    t.string   "image_path"
    t.string   "business_hours"
    t.string   "phone_number"
    t.string   "regular_holiday"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "name"
    t.string   "email"
    t.integer  "sex"
    t.integer  "student_id"
    t.string   "faculty"
    t.string   "entrance_year"
    t.string   "circle"
    t.integer  "info_source"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
