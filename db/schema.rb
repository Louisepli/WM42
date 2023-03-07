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

ActiveRecord::Schema[7.0].define(version: 2023_03_07_130418) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bibles", force: :cascade do |t|
    t.text "content"
    t.integer "party_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buildings", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.bigint "map_id", null: false
    t.string "name"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["map_id"], name: "index_cities_on_map_id"
  end

  create_table "creatures", force: :cascade do |t|
    t.string "name"
    t.integer "lvl"
    t.bigint "universe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["universe_id"], name: "index_creatures_on_universe_id"
  end

  create_table "funs", force: :cascade do |t|
    t.bigint "party_id", null: false
    t.bigint "option_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_id"], name: "index_funs_on_option_id"
    t.index ["party_id"], name: "index_funs_on_party_id"
  end

  create_table "maps", force: :cascade do |t|
    t.bigint "party_id", null: false
    t.string "name"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["party_id"], name: "index_maps_on_party_id"
  end

  create_table "options", force: :cascade do |t|
    t.string "name"
    t.boolean "used"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parties", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.bigint "universe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["universe_id"], name: "index_parties_on_universe_id"
    t.index ["user_id"], name: "index_parties_on_user_id"
  end

  create_table "party_races", force: :cascade do |t|
    t.bigint "party_id", null: false
    t.bigint "race_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["party_id"], name: "index_party_races_on_party_id"
    t.index ["race_id"], name: "index_party_races_on_race_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "username"
    t.integer "party_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "races", force: :cascade do |t|
    t.string "name"
    t.bigint "universe_id", null: false
    t.string "culture"
    t.string "divinity"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["universe_id"], name: "index_races_on_universe_id"
  end

  create_table "universes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cities", "maps"
  add_foreign_key "creatures", "universes"
  add_foreign_key "funs", "options"
  add_foreign_key "funs", "parties"
  add_foreign_key "maps", "parties"
  add_foreign_key "parties", "universes"
  add_foreign_key "parties", "users"
  add_foreign_key "party_races", "parties"
  add_foreign_key "party_races", "races"
  add_foreign_key "races", "universes"
end
