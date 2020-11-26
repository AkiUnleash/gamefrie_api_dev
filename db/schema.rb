# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_25_061327) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "email", null: false
    t.string "hashed_password"
    t.datetime "tmp_authenication_date", null: false
    t.datetime "official_authenication_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index "lower((email)::text)", name: "index_accounts_on_LOWER_email", unique: true
  end

  create_table "diaries", force: :cascade do |t|
    t.bigint "account_id"
    t.string "body", null: false
    t.string "played_game"
    t.string "posted_image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_diaries_on_account_id"
  end

  create_table "genders", force: :cascade do |t|
    t.string "gender_name", null: false
    t.string "display_order", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "account_id"
    t.string "nickname"
    t.string "self_introduction"
    t.bigint "gender_id"
    t.string "game_playing"
    t.string "time_period_playing"
    t.string "profile_image"
    t.string "cover_image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_profiles_on_account_id"
    t.index ["gender_id"], name: "index_profiles_on_gender_id"
  end

  add_foreign_key "diaries", "accounts"
  add_foreign_key "profiles", "accounts"
  add_foreign_key "profiles", "genders"
end
