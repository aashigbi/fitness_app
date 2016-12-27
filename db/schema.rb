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

ActiveRecord::Schema.define(version: 20161218190820) do

  create_table "foods", force: :cascade do |t|
    t.string   "brand"
    t.string   "item"
    t.string   "serving_size"
    t.decimal  "servings"
    t.decimal  "calories"
    t.decimal  "protein"
    t.decimal  "carbs"
    t.decimal  "sugars"
    t.decimal  "fiber"
    t.decimal  "fat"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "foods_users", id: false, force: :cascade do |t|
    t.integer "food_id", null: false
    t.integer "user_id", null: false
    t.index ["food_id"], name: "index_foods_users_on_food_id"
    t.index ["user_id"], name: "index_foods_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "password_confirmation"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.decimal  "target_weight"
    t.decimal  "current_weight"
    t.string   "desired_pace"
    t.decimal  "current_bodyfat"
    t.string   "activity_level"
    t.decimal  "carb_percent"
    t.decimal  "protein_percent"
    t.decimal  "fat_percent"
    t.string   "password_digest"
    t.decimal  "daily_calories"
    t.decimal  "calories_consumed"
    t.decimal  "calories_remaining"
    t.decimal  "daily_carbs"
    t.decimal  "carbs_consumed"
    t.decimal  "carbs_remaining"
    t.decimal  "daily_protein"
    t.decimal  "protein_consumed"
    t.decimal  "protein_remaining"
    t.decimal  "daily_fat"
    t.decimal  "fat_consumed"
    t.decimal  "fat_remaining"
    t.index ["email"], name: "index_users_on_email"
  end

end
