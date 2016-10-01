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

ActiveRecord::Schema.define(version: 20161001204322) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "body",             null: false
    t.integer  "user_id",          null: false
    t.integer  "commentable_id",   null: false
    t.string   "commentable_type", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "custom_fields", force: :cascade do |t|
    t.string   "field_name",            limit: 100, null: false
    t.string   "customable_field_type",             null: false
    t.integer  "customable_field_id",               null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "custom_values", force: :cascade do |t|
    t.string   "field_value",           limit: 100, null: false
    t.integer  "custom_field_id",                   null: false
    t.string   "customable_value_type",             null: false
    t.integer  "customable_value_id",               null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name",        limit: 50, null: false
    t.text     "description",            null: false
    t.integer  "creator_id",             null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "list_experiences", force: :cascade do |t|
    t.date     "date_of_experience",             null: false
    t.string   "main_dish",          limit: 100
    t.integer  "price"
    t.integer  "party_size"
    t.integer  "time_seated"
    t.integer  "time_waiting"
    t.text     "notes"
    t.integer  "list_restaurant_id",             null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "list_restaurants", force: :cascade do |t|
    t.string   "name",            limit: 100,                 null: false
    t.string   "cuisine",         limit: 100
    t.string   "fav_dish",        limit: 100
    t.string   "restaurant_type", limit: 100
    t.string   "location",        limit: 100
    t.boolean  "tried",                       default: false
    t.integer  "restaurant_id",                               null: false
    t.integer  "list_id",                                     null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "lists", force: :cascade do |t|
    t.string   "title",         limit: 100, null: false
    t.string   "listable_type",             null: false
    t.integer  "listable_id",               null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.text     "bio"
    t.string   "zipcode",             limit: 10
    t.date     "birthday"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "phone_number",        limit: 16
    t.string   "gender",              limit: 50
    t.integer  "user_id",                        null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name",                 limit: 100, null: false
    t.string   "restaurant_url"
    t.string   "address",              limit: 200, null: false
    t.string   "locality",             limit: 100
    t.string   "city",                 limit: 100, null: false
    t.string   "zipcode",              limit: 10
    t.string   "average_cost_for_two", limit: 10
    t.string   "featured_img"
    t.string   "menu_url"
    t.boolean  "has_online_delivery"
    t.string   "cuisines"
    t.string   "restaurant_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "votes", force: :cascade do |t|
    t.boolean  "up"
    t.string   "voteable_type", null: false
    t.integer  "voteable_id",   null: false
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
