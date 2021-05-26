# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_25_214240) do

  create_table "contacts", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.integer "mode", default: 0
    t.text "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "modes", force: :cascade do |t|
    t.integer "mode", null: false
    t.string "user_id", limit: 36, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_modes_on_user_id"
  end

  create_table "no_smoking_user_profiles", force: :cascade do |t|
    t.string "user_id", limit: 36, null: false
    t.integer "tabaco_price", null: false
    t.integer "smoking_pace", null: false
    t.integer "hourly_wage", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "start_date"
    t.index ["user_id"], name: "index_no_smoking_user_profiles_on_user_id"
  end

  create_table "reduction_user_profiles", id: { type: :string, limit: 36 }, force: :cascade do |t|
    t.string "user_id", limit: 36, null: false
    t.integer "tabaco_price", null: false
    t.integer "smoking_pace", null: false
    t.integer "hourly_wage", null: false
    t.datetime "start_date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "smoking_count", default: 0
    t.index ["user_id"], name: "index_reduction_user_profiles_on_user_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.integer "counter", default: 0
    t.string "reduction_user_profile_id", limit: 36, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reduction_user_profile_id"], name: "index_stocks_on_reduction_user_profile_id"
  end

  create_table "users", id: { type: :string, limit: 36 }, force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "birth_date"
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.string "activation_state"
    t.string "activation_token"
    t.datetime "activation_token_expires_at"
    t.index ["activation_token"], name: "index_users_on_activation_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  add_foreign_key "modes", "users"
  add_foreign_key "no_smoking_user_profiles", "users"
  add_foreign_key "reduction_user_profiles", "users"
  add_foreign_key "stocks", "reduction_user_profiles"
end
